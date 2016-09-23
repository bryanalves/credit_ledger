require 'test_helper'

class RecentTransactionsTest < ActiveSupport::TestCase
  subject { RecentTransactions }
  describe '#call' do
    it 'returns nothing by default' do
      subject.call.must_equal []
    end

    it 'returns one transaction' do
      credit_item = FactoryGirl.create(:credit_item)
      subject.call.must_equal [credit_item]
    end

    it 'returns two transactions' do
      credit_item = FactoryGirl.create(:credit_item, updated_at: DateTime.now)
      credit_item2 = FactoryGirl.create(:credit_item, updated_at: DateTime.now - 10.seconds)
      subject.call.must_equal [credit_item, credit_item2]
    end

    it 'returns at most 5 transactions' do
      credit_items = [FactoryGirl.create(:credit_item, updated_at: DateTime.now)]
      credit_items << FactoryGirl.create(:credit_item, updated_at: DateTime.now - 10.seconds)
      credit_items << FactoryGirl.create(:credit_item, updated_at: DateTime.now - 20.seconds)
      credit_items << FactoryGirl.create(:credit_item, updated_at: DateTime.now - 30.seconds)
      credit_items << FactoryGirl.create(:credit_item, updated_at: DateTime.now - 40.seconds)
      not_included = FactoryGirl.create(:credit_item, updated_at: DateTime.now - 50.seconds)

      subject.call.must_equal credit_items
    end
  end
end
