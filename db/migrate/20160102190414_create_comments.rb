class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :user_id
      t.integer :comment_id
      t.datetime :comment_creation_date
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
