class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :count_words
      t.string :remember_token
      t.boolean :admin, default: false
      t.string :password_digest

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
    add_index  :users, :remember_token
  end
end
