class Product < ApplicationRecord
  before_save(:titleize_product)
  has_many :reviews, dependent: :destroy
  validates :name, :cost, :country_of_origin, presence: true
  private
    def titleize_product
      self.name = self.name.titleize
    end
end
