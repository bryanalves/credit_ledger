class HighestBalances
  class << self
    delegate :call, to: :new
  end

  def initialize(relation = CreditItem.all)
    @relation = relation
  end

  def call
    @relation.group(:customer).order('sum_value desc').limit(10).balance
  end
end
