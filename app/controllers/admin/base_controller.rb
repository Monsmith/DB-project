class Admin::BaseController < ApplicationController
  before_action: ensure_admin!

  def ensure_admin!
    current_user and current_user.roles == 'admin'
  end
end
