class Product < ApplicationRecord

  scope :most_reviewed, -> {(
    select("products.*, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
    )}
  scope :usa, -> { where(country_of_origin: "Usa")}
  scope :recent_products, -> { order(created_at: :desc).limit(3)}
  before_save(:titleize_product, :titleize_country)
  has_many :reviews, dependent: :destroy
  validates :name, :cost, :country_of_origin, presence: true
  private
    def titleize_product
      self.name = self.name.titleize
    end
    def titleize_country
      self.country_of_origin = self.country_of_origin.titleize
    end
end
