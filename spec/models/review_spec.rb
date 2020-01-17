require 'rails_helper'

describe Review do
  it {should belong_to(:product)}
context '#destroy' do
  it 'should delete review' do
    review = Review.create(author: "steve", content_body: "wow!", rating: 5)
    expect { review.destroy }.to change(Review, :count).by(-1)
  end
end
  context '#create' do
    it 'should create a new review' do
      review = Review.create(author: "steve", content_body: "wow!", rating: 5)
      expect(Review.all).to include(review)
    end
  end
  context '#update' do
    it 'should update review' do
      review = Review.create(author: "steve", content_body: "wow!", rating: 5)
      review.update(author: "jim", content_body: "wow!", rating: 5)
      expect(review.author).to eq("jim")
    end
  end
end
