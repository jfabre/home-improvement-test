class User < ApplicationRecord
  validates_presence_of :email
  
  # Include default devise modules. Others available are:
  # :database_authenticatable, :trackable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :omniauthable, omniauth_providers: %i[facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.full_name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.provider = auth.provider
      user.uid = auth.uid
      user.image = auth.info.image
    end
  end
end
