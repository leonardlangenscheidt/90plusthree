class Correctasso < ActiveRecord::Base
	belongs_to :correction
	belongs_to :match
end
