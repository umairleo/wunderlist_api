class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true 
  validates :username, presence: true, uniqueness: true , format: {with: /\A(\w){1,15}\z/}
  validates :email, presence: true, uniqueness: true , format: {with: /\A(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))\z/}
  validates :password, presence: true

  has_many :sessions , dependent: :destroy
  has_many :lists , dependent: :destroy
  has_many :tasks , through: :lists
end
