class HomeController < ApplicationController
  def index
    @balance = CreditItem.balance
  end
end
