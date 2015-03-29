require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    sign_in FactoryGirl.create(:admin_user)
  end

  describe "#search" do
    it "should be able to return no matches" do
      get :search
      JSON.parse(response.body).must_equal []
    end

    it "should return users" do
      expected_record = FactoryGirl.create(:customer, first_name: 'PASS')
      expected = {value: expected_record.id, label: expected_record.name}.stringify_keys
      get :search, term: 'PASS'
      JSON.parse(response.body).must_equal [expected]
    end
  end
end
