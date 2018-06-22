class ProductsController < ApplicationController
  before_action :find_product, only: [:destroy]

  def create
    # @product = Product.new(product_params)
    # @product.save!
    # redirect_to @product.category


    @product = Product.new(product_params)
    @product.category_id = params[:category_id]
    respond_to do |format|

      if @product.save
        format.html { redirect_to @product.category, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to @product.category, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def find_product
      @product = Product.find(params[:id])
    end
    def product_params
      params.require(:product).permit(:name, :price)
    end
end
