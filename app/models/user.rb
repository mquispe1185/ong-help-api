# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  include DeviseTokenAuth::Concerns::User

  enum role: {
    donor: 0,
    ong_owner: 1,
    campaign_owner: 2,
    multi_owner: 3
  }

  validates :provider, :uid, :name, :image, :email, presence: true, on: :create
  validates :nickname, :role, :first_name, :last_name, presence: true, on: :update

end
