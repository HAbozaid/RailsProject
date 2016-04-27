class PagesController < ApplicationController
	def index
		@acivities = PublicActivity::Activity.order("created_at desc")
	end
end