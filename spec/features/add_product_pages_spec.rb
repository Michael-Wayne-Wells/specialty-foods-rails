require 'rails_helper'



describe "the add,delete, and edit a product process" do
  Admin.delete_all
  User.delete_all
  Product.delete_all
  Admin.create!(username: 'admin', email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  Product.create(name:"test", cost: 22.22, country_of_origin: "usa")
  User.create!(username: 'user', email: 'user@example.com', password: 'password', password_confirmation: 'password')
  before(:each) do
    visit new_admin_session_path
    fill_in 'admin[login]', :with => "admin"
    fill_in 'admin[password]', :with => "password"
    click_on 'Login'
  end

  it "adds a new product" do

    visit products_path
    click_link 'New Product'
    fill_in 'product[name]', :with => 'teeth'
    fill_in 'product[cost]', :with => '32.27'
    fill_in 'product[country_of_origin]', :with => "usa"
    click_on 'Submit'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Teeth'
  end
  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Submit'
    expect(page).to have_content "Name can't be blank"
  end
  it "updates product" do
    visit products_path
    click_link 'New Product'
    fill_in 'product[name]', :with => 'teeth'
    fill_in 'product[cost]', :with => '32.27'
    fill_in 'product[country_of_origin]', :with => "turkey"
    click_on 'Submit'
    click_on 'Teeth'
    click_on 'Edit'
    fill_in 'product[name]', :with => 'hair'
    click_on 'Submit'
    expect(page).to have_content "Hair"
  end
  it "deletes product" do
    visit products_path
    click_link 'New Product'
    fill_in 'product[name]', :with => 'teeth'
    fill_in 'product[cost]', :with => '32.27'
    fill_in 'product[country_of_origin]', :with => "turkey"
    click_on 'Submit'
    click_on 'Teeth'
    click_on 'Delete'
    expect(page).not_to have_content "Teeth"
  end
  it "adds a new product" do
    visit products_path
    click_link 'New Product'
    fill_in 'product[name]', :with => 'teeth'
    fill_in 'product[cost]', :with => '32.27'
    fill_in 'product[country_of_origin]', :with => "turkey"
    click_on 'Submit'
    click_on 'Teeth'
    click_on 'Add a review'
    fill_in 'review[content_body]', :with => 'wow'
    fill_in 'review[rating]', :with => '3'
    click_on 'Submit'
    expect(page).to have_content "admin"
  end
  it "varifies user creation from admin" do
    visit admin_users_path
    expect(page).to have_content "user"
    expect(page).to have_content "user@example.com"
  end
  it "varifies admin creation from admin" do
    visit admin_admins_path
    expect(page).to have_content "admin"
    expect(page).to have_content "admin@example.com"
  end
  it "varifies product listing from admin console" do
    visit admin_products_path
    expect(page).to have_content "Test"
    expect(page).to have_content "22.22"
    expect(page).to have_content "Usa"


  end

end
