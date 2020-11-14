class Stock < ApplicationRecord
  belongs_to :users, optional: true

  validates :name, :count, presence: true
  validates :name, uniqueness: true

end
