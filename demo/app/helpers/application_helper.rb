module ApplicationHelper
  
  def current_blog(by_attribute = :blog_id)
    @current_blog or @current_blog = Blog.find_by_id(params[by_attribute])
  end
end
