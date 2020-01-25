# frozen_string_literal: true

class StaticController < ApplicationController
  def index
    @top_product = Product.most_reviewed.first
    @product_search = Product.where("name ilike '%#{params[:search]}%'").uniq
    @products = Product.all
    render :index
  end
end
