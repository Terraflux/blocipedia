class Wiki < ActiveRecord::Base
	
  belongs_to :user

  validates :title, length: {minimum: 3}, presence: true
  validates :body, length: {minimum: 10}, presence: true

  scope :visible_to, -> (user){user ? all : where(public: true)}
end