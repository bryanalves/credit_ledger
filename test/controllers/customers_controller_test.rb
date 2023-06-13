require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    sign_in FactoryBot.create(:admin_user)
  end

  describe "#search" do
    it "should be able to return no matches" do
      get :search
      _(JSON.parse(response.body)).must_equal []
    end

    it "should return users" do
      expected_record = FactoryBot.create(:customer, first_name: 'PASS')
      expected = {value: expected_record.id, label: expected_record.name}.stringify_keys
      get :search, params: {term: 'PASS'}
      _(JSON.parse(response.body)).must_equal [expected]
    end
  end
end
