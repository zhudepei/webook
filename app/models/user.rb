require 'open-uri'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :lockable, :timeoutable,
         :omniauthable, omniauth_providers: %i[github]

  has_one_attached :avatar

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email        = auth.info.email
      user.password     = Devise.friendly_token[0, 20]
      user.name         = auth.info.name # assuming the user model has a name
      downloaded_avatar = open(auth.info.image)
      user.avatar.attach(io: downloaded_avatar, filename: 'avatar')
    end
  end
end
