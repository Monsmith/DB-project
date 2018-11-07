# frozen_string_literal: true

class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: %i[admin editor organization general], multiple: false) ##
  ############################################################################################

  # after_initialize do
  #   if self.new_record?
  #     self.roles ||= :general
  #   end
  # end
  #
  # enum roles: {
  #     organization: 0,
  #     general: 1,
  #     admin: 3
  # }

  has_many :posts, dependent: :destroy
  has_many :chatrooms, through: :chatroom_users
  has_many :chatroom_users
  has_many :messages
  has_many :likes
  has_many :bookmarks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
