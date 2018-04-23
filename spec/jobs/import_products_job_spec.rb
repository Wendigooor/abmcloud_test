require 'rails_helper'

RSpec.describe ImportProductsJob, type: :job do
  let(:path) { 'spec/fixtures/sku.csv' }
  subject { ImportProductsJob.perform_now(path) }

  context 'import products' do
    it { expect { subject }.to change { Product.count }.by(5) }
  end

  context 'import exist products' do
    before do
      @product = Product.create!(sku: '1978', supplier_code: '1000')
    end

    it { expect { subject }.to change { Product.count }.by(4) }

    context 'updates exist products' do
      it { expect { subject }.to change { @product.reload.supplier_code }.from('1000').to('2437') }
    end
  end

end
