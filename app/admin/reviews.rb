# frozen_string_literal: true

ActiveAdmin.register Review do
  action_item :view_site do
    link_to 'View Site', '/'
  end
  permit_params :author, :content_body, :rating

  index do
    selectable_column
    id_column
    column :author
    column :content_body
    column :rating

    actions
  end
end
