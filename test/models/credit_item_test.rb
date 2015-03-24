require 'test_helper'

class CreditItemTest < ActiveSupport::TestCase
  it "creates a credit item" do
    FactoryGirl.create(:credit_item)
  end
end
