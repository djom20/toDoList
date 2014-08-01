class User < ActiveRecord::Base
	has_many :tasks

	def tasks
		Task.where(:user_id => self.id, :state => 1)
	end
end
