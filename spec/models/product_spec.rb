require 'rails_helper'

describe Product do
  it {should have_many(:reviews)}
end
context 'DELETE #destroy' do
  product = Product.create(name: "pie", cost: "33.33", country_of_origin: "usa")

  it 'should delete product' do
    expect { product.destroy }.to change(Product, :count).by(-1)
  end
end
