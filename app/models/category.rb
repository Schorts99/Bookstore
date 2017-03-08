class Category < ApplicationRecord
  has_many :books

  validates :name, presence: true, length: { in: 3..10 }
end
