class Wiki < ActiveRecord::Base
	
  belongs_to :user

  before_create {self.private ||= false}

  validates :title, length: {minimum: 3}, presence: true
  validates :body, length: {minimum: 10}, presence: true

  scope :visible_to, -> (user){(user.admin? || user.premium?) ? all : where(private: false)}
end