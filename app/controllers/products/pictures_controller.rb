class Products::PicturesController < ApplicationController
  before_action :set_product

  def destroy
    @product.picture.purge_later
    redirect_to edit_product_path(@product)
  end

  private

  def set_product
    @product = Product.find(params[:products_id])
  end
end