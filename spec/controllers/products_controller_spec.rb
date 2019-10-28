require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:product) { create(:product) }

  describe '#show' do
    before { get :show, params: { id: product.id } }

    it { is_expected.to respond_with :success }
  end
end
