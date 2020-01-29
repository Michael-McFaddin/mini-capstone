class Image < ApplicationRecord
  #association method
  belongs_to :product

  #This method does the same as the association method above. Use this to create a custom method.
  # def image
  #   Image.find_by(id: product_id) #returns a product hash
  # end

end
