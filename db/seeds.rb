# frozen_string_literal: true
Product.destroy_all
Review.destroy_all
User.destroy_all
Admin.destroy_all
Admin.create!(username: 'admin', email: 'admin@example.com', password: 'password', password_confirmation: 'password')
50.times do |_index|
  user = User.create!(email: Faker::Internet.email, username: Faker::Internet.username, password: Faker::Internet.password(min_length: 8))
  product = Product.create!(name: Faker::Food.ingredient,
                            cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
                            country_of_origin: Faker::Address.country)
  5.times do |_j|
    product.reviews.create!(author: user.username, content_body: Faker::Lorem.paragraph(sentence_count: 5, supplemental: false, random_sentences_to_add: 0), rating: Faker::Number.within(range: 1..5))
  end
end
p "Created #{Product.count} products"
p "Created #{Review.count} reviews"
p "Created #{User.count} reviews"
