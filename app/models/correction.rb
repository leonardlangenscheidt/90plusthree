class Correction < ActiveRecord::Base
	has_many :correctassos
	has_many :matches, :through => :correctassos

	def mirrorchange
		@mc = 0 
		@homegoals = (self.change - (self.change%10))/10
		@awaygoals = self.change % 10
		@mc = 10* @awaygoals + @homegoals
		@mc
	end

end
