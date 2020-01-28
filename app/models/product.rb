class Product < ApplicationRecord

  #association method
  belongs_to :supplier

  #This method does the same as the associateion method above. Use this to create a custom method.
  # def supplier
  #   Supplier.find_by(id: supplier_id) #returns a supplier hash
  # end

  has_many :images

  validates :name, :price, :description, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: {in: 10..500}

  #model methods
  def is_discounted?
    if price.to_i < 10
      "true"
    else
      "false"
    end
  end

  def tax
    price.to_i * 0.09
  end

  def total
    tax.to_i + price.to_i
  end



end
