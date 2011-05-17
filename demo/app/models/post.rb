class Post < ActiveRecord::Base
  belongs_to :blog
  
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :body
  validates_presence_of :blog_id
  
  def serializable_hash(options={})
    super({
      :include => {
        :blog => {}
      }
    }.merge(options))
  end
  
  def to_pdf
    self.to_xml
  end
end
