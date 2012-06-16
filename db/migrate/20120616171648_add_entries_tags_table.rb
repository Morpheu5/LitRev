class AddEntriesTagsTable < ActiveRecord::Migration
	def up
		create_table :entries_tags, :id => false do |t|
			t.references :entry
			t.references :tag
		end
	end

	def down
		drop_table :entries_tags
	end
end
