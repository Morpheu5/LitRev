class EntriesController < ApplicationController
	# GET /entries
	# GET /entries.json
	def index
		@entries = Entry.all

		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @entries }
		end
	end

	# GET /entries/1
	# GET /entries/1.json
	def show
		@entry = Entry.find_by_id(params[:id])

		respond_to do |format|
			if @entry.nil?
				format.html { redirect_to entries_url, :notice => 'Entry not found.' }
			else
				format.html # show.html.erb
			end
		end
	end

	# GET /entries/new
	# GET /entries/new.json
	def new
		@entry = Entry.new

		respond_to do |format|
			format.html # new.html.erb
		end
	end

	# GET /entries/1/edit
	def edit
		@entry = Entry.find(params[:id])
	end

	# POST /entries
	# POST /entries.json
	def create
		@entry = Entry.new(params[:entry])

		respond_to do |format|
			if @entry.save
				format.html { redirect_to @entry, :notice => 'Entry was successfully created.' }
			else
				format.html { render :action => "new" }
			end
		end
	end

	# PUT /entries/1
	# PUT /entries/1.json
	def update
		@entry = Entry.find(params[:id])

		tags = params[:entry].delete(:tags)
		puts tags
		params[:entry][:tag_ids] = tags.split(',').collect do |tag|
			tag.strip
		end.collect do |tag|
			Tag.find_or_create_by_name(tag)[:id]
		end
		
		respond_to do |format|
			if @entry.update_attributes(params[:entry])
				format.html { redirect_to @entry, :notice => 'Entry was successfully updated.' }
			else
				format.html { render :action => "edit" }
			end
		end
	end

	# DELETE /entries/1
	# DELETE /entries/1.json
	def destroy
		@entry = Entry.find(params[:id])
		@entry.destroy

		respond_to do |format|
			format.html { redirect_to entries_url }
		end
	end
end
