# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  include DeviseTokenAuth::Concerns::User

  has_many :ongs
  has_many :campaigns
  has_many :donations
  
  enum role: {
    donor: 0,
    ong_owner: 1,
    campaign_owner: 2,
    multi_owner: 3,
    admin: 4
  }

  validates :name, :image, :email, presence: true, on: :create
  
end
