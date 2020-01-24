Product.destroy_all
Review.destroy_all
User.destroy_all
Admin.destroy_all



50.times do |index|
  user = User.create!(email: Faker::Internet.email, username: Faker::Internet.username, password: Faker::Internet.password(min_length: 8))
  product = Product.create!(name: Faker::Food.ingredient,
    cost: Faker::Number.decimal(l_digits: 2, r_digits: 2) ,
    country_of_origin: Faker::Address.country)
    5.times do |j|
      product.reviews.create!(author: user.username, content_body: Faker::Lorem.paragraph(20, false, 0), rating: Faker::Number.within(range: 1..5))
    end
  end

  p "Created #{Product.count} products"
  p "Created #{Review.count} reviews"
    p "Created #{User.count} reviews"
Admin.create!(username: 'admin', email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
