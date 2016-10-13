class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :commentable_id
      t.integer :commentable_type
      t.references :voteable, polymorphic: true, index: true
      t.timestamps(null: false)
    end
  end
end
