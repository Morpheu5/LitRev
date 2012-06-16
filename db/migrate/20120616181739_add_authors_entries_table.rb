class AddAuthorsEntriesTable < ActiveRecord::Migration
	def up
		create_table :authors_entries, :id => false do |t|
			t.references :entry
			t.references :author
		end
	end

	def down
		drop_table :authors_entries
	end
end
