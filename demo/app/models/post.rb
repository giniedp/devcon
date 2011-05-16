class Post < ActiveRecord::Base
  belongs_to :blog
  
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :body
  validates_presence_of :blog_id
end
