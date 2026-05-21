class ItemsController < ApplicationController
  def index
  end

  private

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
