class Item < ApplicationRecord
  has_many :items
  has_many :buy_info
end