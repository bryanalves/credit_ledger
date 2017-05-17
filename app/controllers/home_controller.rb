class HomeController < ApplicationController
  def index
    @balance = CreditItem.balance
    @recent_transactions = RecentTransactions.call
    @highest_balances = HighestBalances.call
  end
end
