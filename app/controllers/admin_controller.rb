class AdminController < ApplicationController
before_action :authenticate_admin!


def users
  @users = User.all
  render :users
end

def edit_user
  @admin = current_admin
  @user = User.find(params[:id])
  # binding.pry
  render :edit_user
end

end
