class PagesController < ApplicationController
	def tabelle
	end

	def week
		@allmatches = Match.all
		@matches = []
		@allmatches.each do |m|
			if m.week == params[:week_id].to_i && m.league_id == params[:league_id].to_i
				@matches.push(m)
			end
		end
	end
end
