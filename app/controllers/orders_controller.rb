class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :own_item
  before_action :sold_item

  def index
    gon.public_key = ENV.fetch('PAYJP_PUBLIC_KEY', nil)
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV.fetch('PAYJP_PUBLIC_KEY', nil)
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(
      :post_code,
      :prefecture_id,
      :municipalities,
      :street_address,
      :building_name,
      :telephone_number,
      :token
    ).merge(
      user_id: current_user.id,
      item_id: params[:item_id]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV.fetch('PAYJP_SECRET_KEY', nil)
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def own_item
    return unless current_user.id == @item.user.id

    redirect_to root_path
  end

  def sold_item
    return unless @item.order.present?

    redirect_to root_path
  end
end
