# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html {redirect_to admin_root_path, notice: 'User was successfully destroyed.'}
    end
  end
end
