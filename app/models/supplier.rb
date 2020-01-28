class Supplier < ApplicationRecord

  #association method
  has_many :products

    #This method does the same as the associateion method above. Use this to create a custom method.
  # def products
  #   Product.where(supplier_id: id) #array of all products associated with this supplier
  # end

end