class Forum < ActiveRecord::Base    
  belongs_to :user
  has_many :topics, :order => "created_at DESC", :dependent => :destroy
  has_many :posts, :through => :topics, :source => :posts, :order => "created_at DESC"
  validates_presence_of :title, :user_id

  def validate
    errors.add(:user_id, "must be an administrator") unless user and user.admin?
  end
  
  def self.find_top_level
    self.find(:all, :order => "updated_at DESC", :limit => 1).first rescue nil
  end
end