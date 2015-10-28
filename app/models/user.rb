class User < ActiveRecord::Base

	has_many :wikis
	has_many :users, through: :collaborators

	enum role: [:member, :premium, :admin]

	after_initialize {self.role ||= :member}


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
end
