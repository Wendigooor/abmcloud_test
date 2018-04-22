require 'csv'

class ImportProductsJob < ApplicationJob
  queue_as :default

  def perform(path)
    options = {
      validate: false,
      on_duplicate_key_update: {
        conflict_target: [:sku],
        columns: Product.conflict_import_columns
      }
    }

    items = []
    CSV.foreach(path, col_sep: '¦') do |row|
      items << Product.new(
        sku:           row[0],
        supplier_code: row[1],
        name:          row[2],
        attr_1:        row[3],
        attr_2:        row[4],
        attr_3:        row[5],
        attr_4:        row[6],
        attr_5:        row[7],
        price:         row[8]
      )
    end
    Product.import items, options
  end
end

