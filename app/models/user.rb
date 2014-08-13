class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
	has_many :tasks

	def tasks
		Task.where(:user_id => self.id, :state => 1)
	end
end
