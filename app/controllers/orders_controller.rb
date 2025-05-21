class OrdersController < ApplicationController
  before_action :set_item

  def index
    @order_address = OrderAddress.new
  end

  def create
    binding.pry
    @order_address = OrderAddress.new(order_params)
   if @order_address.valid?
    @order_address.save
    return redirect_to root_path
   else
    render 'index', status: :unprocessable_entity
   end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

 def order_params
  params.require(:order_address).permit(
    :postal_code,
    :prefecture_id,
    :city,
    :address,
    :building_name,
    :phone_number,
    :token
  ).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
 end

end
