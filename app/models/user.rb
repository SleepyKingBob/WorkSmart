class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, :password, :work_hours, presence: true
  has_many :projects
  has_one :schedule, dependent: :destroy

  # devise :database_authenticatable, :registerable, :omniauthable, omniauth_providers: %i[google_oauth2]

  # def self.from_omniauth(access_token)
  #   data = access_token.info
  #   user = User.where(email: data['email']).first

  #   unless user
  #     user = User.create(
  #         email: data['email'],
  #         password: Devise.friendly_token[0,20]
  #     )
  #   end
  #   user
  # end
end
