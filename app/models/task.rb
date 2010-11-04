class Task < ActiveRecord::Base
  belongs_to :task_group
  has_many :players_tasks
  has_many :players, :through=>:players_tasks

	after_save :free_players

	private
	def free_players
		if self.completed
			self.players_tasks.each do |pt|
				pt.destroy
			end
		end
	end
end
