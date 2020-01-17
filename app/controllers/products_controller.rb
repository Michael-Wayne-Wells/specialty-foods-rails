class ProductsController < ApplicationController

  def index
    @top_product = Product.most_reviewed.first
    @product_search = Product.where("name ilike '%#{params[:search]}%'").uniq
    @products = Product.all
    @page_products = Kaminari.paginate_array(@products).page(params[:page]).per(10)
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end


  private
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin)
  end
end
