class WikisController < ApplicationController
	
	def index
		@wikis = Wiki.visible_to(current_user)
	end

	def show
		@wiki = Wiki.find(params[:id])
	end

	def new
		@wiki = Wiki.new
	end

	def create
		@wiki = Wiki.new(wiki_params)
		if @wiki.save
			redirect_to @wiki, notice: "New Wiki Created"
		else
			flash[:error] = "Wiki Creation Error"
			render :new
		end
	end

	def edit
		@wiki = Wiki.find(params[:id])
	end

	def update
		@wiki = Wiki.find(params[:id])
		@wiki.assign_attributes(wiki_params)
		if @wiki.save
			flash[:notice] = "Wiki Updated"
			redirect_to @wiki
		else
			flash[:error] = "Wiki Update Error"
			render :show
		end
	end

	def destroy
		@wiki = Wiki.find(params[:id])
		if @wiki.destroy
			flash[:notice] = "\"#{@wiki.title}\" Deleted"
			redirect_to action: :index
		else
			flash[:error] = "Wiki Deletion Error"
			render :show
		end
	end

	private

	def wiki_params
		params.require(:wiki).permit(:title, :body, :private)
	end

end
