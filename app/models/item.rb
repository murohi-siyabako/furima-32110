class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_history
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :prepare
  belongs_to_active_hash :postage
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :category

  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :price
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
  validates :price, numericality: { only_integer: true, message: "Half-width number." }
  validates :item_condition_id, numericality: { other_than: 0, message: "Select" }
  validates :postage_id, numericality: { other_than: 0, message: "Select" }
  validates :prefecture_id, numericality: { other_than: 0, message: "Select" }
  validates :prepare_id, numericality: { other_than: 0, message: "Select" }
  validates :category_id, numericality: { other_than: 0, message: "Select" }
  
end
