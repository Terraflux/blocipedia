class CollaboratorsController < ApplicationController



	def new
		@users = User.all
	end

	def create
		@wiki = Wiki.find(params[:id])
		@collaborator = Collaborator.new(wiki_id: @wiki , user_id:  )
	end

end
