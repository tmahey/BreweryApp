class State < ApplicationRecord
  has_many :breweries, dependent: :destroy
  validates :name, presence: true
end
