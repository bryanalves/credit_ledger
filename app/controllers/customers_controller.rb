class CustomersController < ApplicationController
  before_action -> { authorize! :manage, Customer }

  def index
    @customers = Customer.paginate(page: params[:page], per_page: 10)
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

  def search
    render json: Customer.search(params[:term]).map(&:for_autocomplete).to_json
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :postal_code, :customer_id, :email)
  end
end
