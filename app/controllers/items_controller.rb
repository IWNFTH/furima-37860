class ItemsController < ApplicationController
  before_action :move_to_index, only: :new

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :days_to_ship_id, :price ).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to user_session_path
    end
  end
end