class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :description, :category_id, :condition_id,
      :shipping_fee_id, :prefecture_id, :scheduled_delivery_id,
      :price, :image
    )
  end
end
