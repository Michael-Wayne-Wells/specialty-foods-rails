# frozen_string_literal: true

ActiveAdmin.register User do
  action_item :view_site do
    link_to 'View Site', '/'
  end
  permit_params :email, :username, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :username
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end
end
