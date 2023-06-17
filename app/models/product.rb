# frozen_string_literal: true

class Product < ApplicationRecord
  has_many_attached :pictures

  def picture_as_thumbnail(pic)
    return unless pic.content_type.in?(%W[image/jpeg image/png])
    pic.variant(resize_to_limit: [200, 200]).processed
  end
end
