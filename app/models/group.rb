class Group < ActiveRecord::Base

  has_many :memberships
  has_many :users, through: :memberships
  attachment :group_image

end
