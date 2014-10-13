class CustomersController < ApplicationController
  before_action -> { authorize! :manage, Customer }

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.valid?
      @customer.save!
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :postal_code, :customer_id, :email)
  end
end
