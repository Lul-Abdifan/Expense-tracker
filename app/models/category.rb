class Category < ApplicationRecord
  belongs_to :user
  has_many :entities, class_name: 'Entity'

  validates :name, :icon, presence: true, length: { maximum: 100 }
end
