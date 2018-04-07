class ServerUser < ApplicationRecord
  devise :database_authenticatable, :rememberable, :trackable, :validatable,
         :registerable, :confirmable

  has_many :oauth_applications, class_name: 'Doorkeeper::Application', as: :owner
end
