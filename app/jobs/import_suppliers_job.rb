require 'csv'

class ImportSuppliersJob < ApplicationJob
  queue_as :default

  def perform(path)
    options = {
      validate: false,
      on_duplicate_key_update: [:code]
    }

    items = []
    CSV.foreach(path, col_sep: '¦') do |row|
      items << Supplier.new(code: row[0], name: row[1])
    end
    Supplier.import items, options
  end
end
