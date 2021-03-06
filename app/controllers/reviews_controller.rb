# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authorize_admin_user, only: %i[new create]
  before_action :authenticate_admin!, only: %i[edit destroy]
  before_action :set_product, except: %i[update destroy]
  before_action :set_review, only: %i[show edit update destroy]

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = 'Review successfully added!'
      redirect_to product_path(@product)
    else
      flash[:alert] = 'Error adding review'
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to product_path(@review.product)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:author, :content_body, :rating)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
