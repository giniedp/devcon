class Blog < ActiveRecord::Base
  has_many :posts
  belongs_to :user
  
  validates_presence_of :user_id
  validates_presence_of :title
  validates_presence_of :description
  
  def serializable_hash(options={})
    super({
      :include => {
        :posts => {}
      }
    }.merge(options))
  end
end
