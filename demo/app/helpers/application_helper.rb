module ApplicationHelper
  
  def scoped_blog(by_attribute = :blog_id)
    @scoped_blog or @scoped_blog = Blog.find_by_id(params[by_attribute])
  end
  
  def scoped_user(by_attribute = :user_id)
    @scoped_user or @scoped_user = User.find_by_id(params[by_attribute])
  end
end
