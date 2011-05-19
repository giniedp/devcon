class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
  
  validates_presence_of :name
  
  def serializable_hash(options={})
    super({
      :include => {
        :users => {}
      }
    }.merge(options))
  end
end
