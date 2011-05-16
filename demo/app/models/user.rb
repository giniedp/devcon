class User < ActiveRecord::Base
  has_many :blogs
  has_many :posts, :through => :blogs
  has_many :roles
  
  validates_presence_of :email
  validates_presence_of :username
end
