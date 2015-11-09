class CollaboratorsController < ApplicationController



	def new
		@wiki = Wiki.find(params[:wiki_id])
		@users = User.all
	end

	def create
		@user = User.find(params[:user_id])
		@wiki = Wiki.find(params[:wiki_id])
		@collaborator = Collaborator.new(wiki_id: @wiki.id , user_id: @user.id)
		
		if @collaborator.save
			flash[:notice] = "Collaborator Added"
			redirect_to @wiki
		else
			flash[:error] = "Error adding Collaborator"
			render :new
		end
	end

	def destroy
		@wiki = Wiki.find(params[:wiki_id])
		@collaborator = Collaborator.find(params[:id])
		if @collaborator.destroy
			flash[:notice] = "Collaborator removed"
			redirect_to @wiki
		else
			flash[:error] = "Error Removing Collaborator"
			redirect_to @wiki
		end
	end

end