require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to validate_uniqueness_of(:sku) }

  it { is_expected.to belong_to(:supplier) }
end
