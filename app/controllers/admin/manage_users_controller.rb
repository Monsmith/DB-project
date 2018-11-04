# frozen_string_literal: true

class Admin::ManageUsersController < Admin::BaseController
  layout 'admin'
  def index
    @list_users = User.all
  end

  def show;
  end
end
