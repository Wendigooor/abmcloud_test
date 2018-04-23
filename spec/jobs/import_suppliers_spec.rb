require 'rails_helper'

RSpec.describe ImportSuppliersJob, type: :job do
  let(:path) { 'spec/fixtures/suppliers.csv' }
  subject { ImportSuppliersJob.perform_now(path) }

  context 'import suppliers' do
    it { expect { subject }.to change { Supplier.count }.by(5) }
  end

  context 'import exist suppliers' do
    before do
      @supplier = Supplier.create!(code: '0975', name: 'tmp_name')
    end

    it { expect { subject }.to change { Supplier.count }.by(4) }

    context 'updates exist suppliers' do
      it { expect { subject }.to change { @supplier.reload.name }.from('tmp_name').to('Sporer Inc') }
    end
  end

end
