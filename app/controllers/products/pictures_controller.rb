class Products::PicturesController < ApplicationController
  before_action :set_product

  def destroy
    if picture = @product.pictures.find(params[:blob_id])
      picture.purge_later
      redirect_to edit_product_path(@product)
    else
      render edit_product_path(@product)
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end