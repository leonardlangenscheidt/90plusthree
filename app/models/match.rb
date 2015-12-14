class Match < ActiveRecord::Base
	belongs_to :team
	belongs_to :league

	has_many :correctassos
	has_many :corrections, :through => :correctassos

	def team1goals
		(self.real_result - self.real_result % 10)/10
	end

	def team2goals
		self.real_result % 10
	end
end
