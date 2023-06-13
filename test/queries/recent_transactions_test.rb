require 'test_helper'

class RecentTransactionsTest < ActiveSupport::TestCase
  subject { RecentTransactions }
  describe '#call' do
    it 'returns nothing by default' do
      _(subject.call).must_equal []
    end

    it 'returns one transaction' do
      credit_item = FactoryBot.create(:credit_item)
      _(subject.call).must_equal [credit_item]
    end

    it 'returns two transactions' do
      credit_item = FactoryBot.create(:credit_item, updated_at: DateTime.now)
      credit_item2 = FactoryBot.create(:credit_item, updated_at: DateTime.now - 10.seconds)
      _(subject.call).must_equal [credit_item, credit_item2]
    end

    it 'returns at most 5 transactions' do
      credit_items = [FactoryBot.create(:credit_item, updated_at: DateTime.now)]
      credit_items << FactoryBot.create(:credit_item, updated_at: DateTime.now - 10.seconds)
      credit_items << FactoryBot.create(:credit_item, updated_at: DateTime.now - 20.seconds)
      credit_items << FactoryBot.create(:credit_item, updated_at: DateTime.now - 30.seconds)
      credit_items << FactoryBot.create(:credit_item, updated_at: DateTime.now - 40.seconds)
      not_included = FactoryBot.create(:credit_item, updated_at: DateTime.now - 50.seconds)

      _(subject.call).must_equal credit_items
    end
  end
end
