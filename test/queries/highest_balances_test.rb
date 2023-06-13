require 'test_helper'

class HighestBalancesTest < ActiveSupport::TestCase
  subject { HighestBalances }
  describe '#call' do
    it 'returns nothing by default' do
      _(subject.call).must_equal({})
    end

    it 'returns 1 transaction for 1 customer' do
      credit_item = FactoryGirl.create(:credit_item)
      expected = {
        credit_item.customer => credit_item.value
      }

      _(subject.call).must_equal expected
    end

    it 'returns 2 transactions for 2 customers' do
      credit_item = FactoryGirl.create(:credit_item)
      credit_item2 = FactoryGirl.create(:credit_item)

      expected = {
        credit_item.customer => credit_item.value,
        credit_item2.customer => credit_item2.value
      }

      _(subject.call).must_equal expected
    end

    it 'returns sums of transactions for the same user' do
      credit_item = FactoryGirl.create(:credit_item)
      FactoryGirl.create(:credit_item, customer: credit_item.customer)

      expected = {
        credit_item.customer => BigDecimal.new('4.0')
      }

      _(subject.call).must_equal expected
    end
  end
end
