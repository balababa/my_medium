class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :stories
  validates :username, format: { with: /\w+/,
  message: " must  contain at least one letter, number or underscore " }, uniqueness: true
  has_one_attached :avatar
end
