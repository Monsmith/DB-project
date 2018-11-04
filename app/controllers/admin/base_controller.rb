# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  before_action :ensure_admin!
  before_action :authenticate_user!

  def ensure_admin!
    unless current_user.roles == %i[admin user]
      redirect_to root_path, danger: "You don't belong there"
    end
  end
end
