class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]
  before_action :sold_item, only: [:edit]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def check_owner
    return unless current_user != @item.user

    redirect_to root_path
  end

  def sold_item
    if @item.order.present?
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :description,
      :category_id,
      :condition_id,
      :shipping_cost_id,
      :prefecture_id,
      :shipping_time_id,
      :price
    )
  end
end
