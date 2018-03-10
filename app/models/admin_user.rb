class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable, :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
         :validatable
end
