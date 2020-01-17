Product.destroy_all
Review.destroy_all

50.times do |index|
  product = Product.create!(name: Faker::Food.ingredient,
    cost: Faker::Number.decimal(l_digits: 2, r_digits: 2) ,
    country_of_origin: Faker::Nation.nationality)
    5.times do |j|
      product.reviews.create!(author: Faker::Movies::StarWars.character, content_body: Faker::Lorem.paragraph(20, false, 0), rating: Faker::Number.within(range: 1..5))
    end
  end

  p "Created #{Product.count} products"
  p "Created #{Review.count} reviews"
