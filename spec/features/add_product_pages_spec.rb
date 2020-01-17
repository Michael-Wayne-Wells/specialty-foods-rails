require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'New Product'
    fill_in 'product[name]', :with => 'teeth'
    fill_in 'product[cost]', :with => '32.27'
    fill_in 'product[country_of_origin]', :with => "usa"
    click_on 'Submit'
    expect(page).to have_content 'Product successfully added!'
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
  it "updates product" do
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
end
