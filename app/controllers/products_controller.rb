class ProductsController < ApplicationController
  # before_action :find_todo, only: [:show, :edit, :update, :destroy, :complete]

  def create
    @product = Product.new(product_params)
    @product.save!
    redirect_to categories_path
  end



  private

    def product_params
      params.require(:product).permit(:name, :price)
    end
end
