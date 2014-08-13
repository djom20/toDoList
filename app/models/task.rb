class Task < ActiveRecord::Base
  	belongs_to :user
  	has_many :tickets

  	def tickets
		Ticket.where(:task_id => self.id, :state => 1)
	end
end
