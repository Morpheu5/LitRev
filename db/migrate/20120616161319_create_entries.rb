class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.date :review_date
      t.text :review
      t.integer :rating

      t.timestamps
    end
  end
end
