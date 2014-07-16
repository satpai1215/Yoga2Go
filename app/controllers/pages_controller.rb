class PagesController < ApplicationController

	def home
		if signed_in?
			redirect_to decks_path
		end
	end

end
