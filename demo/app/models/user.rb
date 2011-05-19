class User < ActiveRecord::Base
  include ModelExtensions::UserApplyRoles
  
  has_many :blogs
  has_many :posts, :through => :blogs
  has_and_belongs_to_many :roles
  
  validates_presence_of :email
  validates_presence_of :username
  
  def serializable_hash(options={})
    super({
      :include => {
        :roles => {}
      }
    }.merge(options))
  end
  
  def to_pdf
    self.to_xml
  end

end
