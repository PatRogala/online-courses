class Manufacturer < ApplicationRecord
  has_many :widgets
  belongs_to :address
end
