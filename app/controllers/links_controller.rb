class LinksController < ApplicationController
	before_filter :signed_in_user, only: [:create, :index, :edit, :update]

	def index
	end

	def all
		@links = Link.all
	end

	def create
		long_link = params[:link][:full_link]
		if long_link.split("//").first == "http:"
			link_array = long_link.split("//")
			domain = link_array.shift
		else
			domain = long_link
		end
		
		l = Link.new
		l.full_link = ["https://",domain].join
		l.random_string = SecureRandom.urlsafe_base64(6)
		l.visits = 0
		l.save

		redirect_to preview_path(l.random_string)
	end

	def preview
		gen_string = params[:placeholdervariableidontcare]
        @link = Link.where(random_string: gen_string).take
	end

	def redirect
		gen_string = params[:placeholdervariableidontcare]
        row = Link.where(random_string: gen_string).take
       	row.increment(:visits, by = 1)
        row.save

        redirect_to "#{row.full_link}"
	end

	def edit
		gen_string = params[:placeholdervariableidontcare]
		@link = Link.where(random_string: gen_string).take

	end

	def update
		get
		# @link.random_string = params[:link][:random_string]
		updated_info = params.require(:link).permit(:random_string)
		@link.update_attributes(updated_info)

		# redirect_to all_path
		# redirect_to preview_path  //=> this doesn't work
		redirect_to "/go/#{@link.random_string}/preview"
		
	end

	def delete
		link_to_delete = params[:id]
        Link.destroy(link_to_delete)
		redirect_to all_path
	end

	private

	def get
		@link = Link.find(params[:placeholdervariableidontcare])		
	end

end