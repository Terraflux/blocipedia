class Wiki < ActiveRecord::Base
	
  belongs_to :user

  has_many :collaborators
  has_many :users, through: :collaborators



  before_save :default_to_public

  validates :title, length: {minimum: 3}, presence: true
  validates :body, length: {minimum: 10}, presence: true


## scope :visible_to, -> (user){(user.admin? || user.premium?) ? all : where(is_private: false)}

  def find_collaborator(user)
    collaborators.find_by(user_id: user.id)
  end


  private

  def default_to_public
  	self.is_private ||= false
  	true
  end

end