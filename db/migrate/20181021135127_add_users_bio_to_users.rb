# frozen_string_literal: true

class AddUsersBioToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image, :string
    add_column :users, :bio, :text
    add_column :users, :website, :string
  end
end
