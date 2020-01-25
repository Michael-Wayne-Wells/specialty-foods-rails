# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params :name, :cost, :country_of_origin

  index do
    selectable_column
    id_column
    column :name
    column :cost
    column :country_of_origin
    actions
  end
end
