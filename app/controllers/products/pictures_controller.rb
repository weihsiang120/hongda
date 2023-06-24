# frozen_string_literal: true

class Products::PicturesController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :set_product

  def destroy
    @picture = @product.pictures.find(params[:blob_id])
    @picture.purge_later
    respond_to do |format|
      format.html { redirect_to edit_product_path(@product) }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(dom_id(@picture, :picture)) }
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end
