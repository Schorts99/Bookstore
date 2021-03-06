class Author < ApplicationRecord
  has_many :books

  validates :first_name, presence: true, length: { in: 4..20 }
  validates :last_name, presence: true, length: { in: 4..20 }
end
