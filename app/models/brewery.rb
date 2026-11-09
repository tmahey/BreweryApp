class Brewery < ApplicationRecord
  belongs_to :state
  validates :name, :brewery_type, :city, presence: true
end
