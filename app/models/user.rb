class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :recoverable 
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
  has_many :events, dependent: :destroy
  has_many :calendars, dependent: :destroy
end
