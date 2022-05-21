class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    redirect_to root_path if (current_user.id != @item.user_id) && @item.orders.present?
    redirect_to root_path if (current_user.id == @item.user_id)
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(amount: Item.find(params[:item_id]).price,card: order_params[:token],currency: 'jpy')
      @order_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :shipping_area_id, :ship_city, :ship_address,
                                          :building, :tel_number, :price).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end
end