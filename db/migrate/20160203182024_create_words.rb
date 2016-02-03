class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
    	t.integer :user_id
    	t.string :foreign_words
    	t.string :translation

      t.timestamps null: false
    end
    add_index :words, [:user_id, :created_at]
  end
end
