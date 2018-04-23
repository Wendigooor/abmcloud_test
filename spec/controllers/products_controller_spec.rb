require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET index" do
    it 'returns a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'POST create' do
    subject do
      post :create, params: { file: fixture_file_upload('sku.csv') }
    end

    it 'add sidekiq worker job' do
      expect{subject}.to change{Sidekiq::Worker.jobs.count}.by(1)
    end

    it 'redirect to index page' do
      expect(subject).to redirect_to(products_url)
    end
  end
end
