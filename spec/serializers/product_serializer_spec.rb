require 'rails_helper'

RSpec.describe ProductSerializer, type: :serializer do
  let(:object) { create(:product) }
  let(:hash) { described_class.new(object).serializable_hash }
  let(:data) { hash[:data] }

  describe 'data' do
    subject { data }

    it { is_expected.to include :id }
    it { is_expected.to include type: :product }
  end

  describe 'attributes' do
    subject { data[:attributes] }

    it { is_expected.to include :name }
    it { is_expected.to include :description }
    it { is_expected.to include :price }
  end
end
