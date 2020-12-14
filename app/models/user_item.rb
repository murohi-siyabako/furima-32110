class UserItem
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: "Select" }
    validates :city
    validates :house_number
    validates :phone_number, numericality: { only_integer: true, message: "Input only number"}
    validates :user_id
    validates :item_id
    validates :token
  end
  def save
    purchase = PurchaseHistory.create(user_id: user_id, item_id: item_id )
    SendingDestination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_history_id: purchase.id)
  end

end