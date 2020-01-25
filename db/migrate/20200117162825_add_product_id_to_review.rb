# frozen_string_literal: true

class AddProductIdToReview < ActiveRecord::Migration[5.2]
  def change
    add_column(:reviews, :product_id, :integer)
  end
end
