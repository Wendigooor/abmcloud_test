class Product < ApplicationRecord
  belongs_to :supplier, primary_key: :code, foreign_key: :supplier_code, optional: true

  validates :sku, uniqueness: true

  def self.conflict_import_columns
    exclude_columns = [:id, :created_at, :updated_at]
    Product.attribute_names.map(&:to_sym) - exclude_columns
  end
end
