class HomeController < ApplicationController
  def index
    @balance = CreditItem.balance
    @recent_transactions = RecentTransactions.call
  end
end
