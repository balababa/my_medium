class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :stories
  validates :username, format: { with: /@\w+/,
  message: " must starts with @ and contain at least one letter, number or underscore " }, uniqueness: true
end
