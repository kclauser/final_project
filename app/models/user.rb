class User < ActiveRecord::Base

  has_many :memberships
  has_many :groups, through: :memberships

  def self.from_omniauth(auth)
    user = where(provider: auth['provider'], uid: auth['uid']).first_or_create

    user.name         = auth.info.name
    user.email        = auth.info.email
    user.nickname     = auth.info.nickname
    user.access_token = auth.credentials.token
    user.save!

    return user
  end
end
