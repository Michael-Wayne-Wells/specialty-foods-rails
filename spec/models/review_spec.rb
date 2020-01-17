require 'rails_helper'

describe Review do
  context "validations" do
    it { should validate_presence_of :author }
    it { should validate_presence_of :content_body }
    it { should validate_length_of :content_body }
    it { should validate_presence_of :rating }
    it { should validate_numericality_of :rating }


  end

  it {should belong_to(:product)}
  context '#destroy' do
    it 'should delete review' do
      product = Product.create(name: "pie", cost: "33.33", country_of_origin: "usa")
      review = product.reviews.create(author: "steve", content_body: "wow!", rating: 5)
      expect { review.destroy }.to change(Review, :count).by(-1)
    end
  end
  context '#create' do
    it 'should create a new review' do
      product = Product.create(name: "pie", cost: "33.33", country_of_origin: "usa")
      review = product.reviews.create(author: "steve", content_body: "wow!", rating: 5)
      expect(product.reviews.all).to include(review)
    end
  end
  context '#update' do
    it 'should update review' do
      product = Product.create(name: "pie", cost: "33.33", country_of_origin: "usa")
      review = product.reviews.create(author: "steve", content_body: "wow!", rating: 5)
      review.update(author: "jim", content_body: "wow!", rating: 5)
      expect(review.author).to eq("jim")
    end
  end
end
