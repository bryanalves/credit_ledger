require 'test_helper'

class CreditItemTest < ActiveSupport::TestCase
  it "creates a credit item" do
    FactoryBot.create(:credit_item)
  end
end
