require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  describe "search" do
    it "matches nothing by default" do
      _(Customer.search("")).must_be_empty
    end

    it "finds users by first name" do
      expected = FactoryBot.create(:customer, first_name: 'PASS')
      _(Customer.search('PASS')).must_equal [expected]
    end

    it "finds users by last name" do
      expected = FactoryBot.create(:customer, last_name: 'PASS')
      _(Customer.search('PASS')).must_equal [expected]
    end

    it "finds users by email" do
      expected = FactoryBot.create(:customer, email: 'PASS@example.com')
      _(Customer.search('PASS@example.com')).must_equal [expected]
    end

    it "finds multiple users" do
      expected = FactoryBot.create(:customer, email: 'PASS@example.com')
      expected2 = FactoryBot.create(:customer, first_name: 'PASS')

      _(Customer.search('PASS')).must_equal [expected, expected2]
    end

    it "doesn't match other search terms" do
      FactoryBot.create(:customer, first_name: 'FAIL')
      _(Customer.search('something')).must_be_empty
    end
  end
end
