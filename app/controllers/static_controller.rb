class StaticController < ApplicationController
before_action :authenticate_admin!, except: [:index]
  def index
    @top_product = Product.most_reviewed.first
    @product_search = Product.where("name ilike '%#{params[:search]}%'").uniq
    @products = Product.all
    render :index
  end


end
