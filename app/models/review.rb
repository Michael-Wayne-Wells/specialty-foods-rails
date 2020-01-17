class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :content_body, length: { maximum: 250, minumum: 50 }, presence: true
  validates :rating,  numericality: { greater_than: 0, less_than_or_equal_to: 5 }, presence: true
end
