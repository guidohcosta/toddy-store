class ProductsController < ApplicationController
  before_action :load_product, only: :show

  def show
    render json: ProductSerializer.new(@product).serialized_json
  end

  private

  def load_product
    @product = Product.find(params.require(:id))
  end
end
