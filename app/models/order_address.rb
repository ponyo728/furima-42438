class OrderAddress
  include ActiveModel::Model

  attr_accessor :post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number, :user_id,
                :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipalities
    validates :street_address
    validates :telephone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid.' }
    validates :user_id
    validates :item_id
    validates :token
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :prefecture_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(
      post_code: post_code,
      prefecture_id: prefecture_id,
      municipalities: municipalities,
      street_address: street_address,
      building_name: building_name,
      telephone_number: telephone_number,
      order_id: order.id
    )
  end
end
