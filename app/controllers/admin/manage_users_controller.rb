class Admin::ManageUsersController < ApplicationController
  def index
    @list_users = User.all
  end
end
