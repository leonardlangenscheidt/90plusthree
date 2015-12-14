class Team < ActiveRecord::Base
	has_many :ligassos
	has_many :leagues, :through => :ligassos
	has_many :matches
end
