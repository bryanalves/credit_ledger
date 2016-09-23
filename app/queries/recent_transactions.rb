class RecentTransactions
  class << self
    delegate :call, to: :new
  end

  def initialize(relation = CreditItem.all)
    @relation = relation
  end

  def call
    @relation.order(updated_at: :desc).includes(:customer, :category).limit(5)
  end
end
