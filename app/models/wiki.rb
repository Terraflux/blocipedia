class Wiki < ActiveRecord::Base
	
  belongs_to :user

  before_save :default_to_public

  validates :title, length: {minimum: 3}, presence: true
  validates :body, length: {minimum: 10}, presence: true

  scope :visible_to, -> (user){(user.admin? || user.premium?) ? all : where(private: false)}



  private

  def default_to_public
  	self.private ||= false
  end

end