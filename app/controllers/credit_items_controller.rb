class CreditItemsController < ApplicationController
  before_action :find_customer
  before_action -> { authorize @customer, :manage? }, except: :index

  def index
    if !current_user.try(:admin?)
      raise Pundit::NotAuthorizedError, 'invalid view token' unless params[:view_token] == @customer.view_token
    end

    @new_credit_item = @customer.credit_items.build
    @view_qr_code =  RQRCode::QRCode.new(customer_credit_items_url(@customer, view_token: @customer.view_token))
                                    .as_png(size: 240)

    @credit_items = @customer.credit_items
      .includes(:category)
      .order("updated_at DESC")
      .paginate(page: params[:page], per_page: 10)
  end

  def new
    if Category.count.zero?
      flash[:alert] = "Can not add credit items because no categories are registered"
      begin
        redirect_to(:back)
      rescue ActionController::RedirectBackError
        redirect_to root_path
      end
      return
    end

    @credit_item = @customer.credit_items.build
  end

  def create
    @credit_item = @customer.credit_items.build(credit_item_params)
    if @credit_item.valid?
      @credit_item.save!
      redirect_to customer_credit_items_path(@customer)
    else
      render :new
    end
  end

  private

  def find_customer
    @customer = Customer.find(params[:customer_id])
  end

  def credit_item_params
    params.require(:credit_item).permit(:category_id, :value, :note).merge({user_id: current_user.id})
  end
end
