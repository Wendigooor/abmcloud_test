require 'csv'

class ImportSuppliersJob < ApplicationJob
  queue_as :default

  def perform(path)
    headers = [:code, :name]
    options = {
      validate: false,
      on_duplicate_key_update: {
        conflict_target: [:code],
        columns: [:name],
        batch_size: 100
      }
    }

    items = []
    CSV.foreach(path, col_sep: '¦') do |row|
      items << Supplier.new(code: row.first, name: row.second)
    end
    Supplier.import items, headers, options
  end
end
