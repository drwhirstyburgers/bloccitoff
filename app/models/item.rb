class Item < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates:name, length: { minimum: 1 }
end
