class LinksController < ApplicationController

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
		gen_string = Link.find(params[:placeholdervariableidontcare])
		# gen_string.update_attributes(params.([:link][:random_string])

		redirect_to all_path
		# t = Link.find(#)
		# t.random_string = new random_string
		# t.save
		# validates_length_of :random_string, :minimum => 10
		# validates_presence_of :status ...equal to true or fales
	end

	def delete
		link_to_delete = params[:id]
        Link.destroy(link_to_delete)
		redirect_to all_path
	end

	

end