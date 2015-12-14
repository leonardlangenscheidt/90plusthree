class League < ActiveRecord::Base
	has_many :ligassos
	has_many :teams, :through => :ligassos
end
