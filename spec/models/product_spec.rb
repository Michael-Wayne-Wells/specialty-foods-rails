require 'rails_helper'

describe Product do
context "validations" do
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }
  it {should have_many(:reviews)}
end
context '#destroy' do
  it 'should delete product' do
    product = Product.create(name: "pie", cost: "33.33", country_of_origin: "usa")
    expect { product.destroy }.to change(Product, :count).by(-1)
  end
end
  context '#create' do
    it 'should create a new product' do
      product = Product.create(name: "pie", cost: "33.33", country_of_origin: "usa")
      expect(Product.all).to include(product)
    end
  end
  context '#update' do
    it 'should update product' do
      product = Product.create(name: "pie", cost: "33.33", country_of_origin: "usa")
      product.update(name: "cheese", cost: "33.33", country_of_origin: "usa")
      expect(product.name).to eq("cheese")
    end
  end
end
