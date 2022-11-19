class Car < ApplicationRecord
  belongs_to :user
  has_many :bid
  has_one_attached :picture
end
