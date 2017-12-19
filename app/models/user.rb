class User < ApplicationRecord
  has_many :projects, foreign_key: "owner_id", dependent: :destroy
  validates_presence_of :email
  
  enum role: [:user, :admin]
  after_initialize :set_default_role, if: :new_record?

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

  def set_default_role
    self.role ||= :user
  end
end
