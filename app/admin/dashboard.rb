# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  action_item :view_site do
    link_to 'View Site', '/'
  end
  menu priority: 1
  content title: proc { I18n.t('active_admin.dashboard') } do
    link_to('Homepage', '/')
    columns do
      column { |_instance| link_to 'Homepage', '/' }
      column do
        panel 'Total No. of Users' do
          ul do
            li User.count
          end
        end
      end
      column do
        panel 'Total No. of Admins' do
          ul do
            li Admin.count
          end
        end
      end
      column do
        panel 'Total No. of Products' do
          ul do
            li Product.count
          end
        end
      end
      column do
        panel 'Total No. of Reviews' do
          ul do
            li Review.count
          end
        end
      end
    end
  end
end
