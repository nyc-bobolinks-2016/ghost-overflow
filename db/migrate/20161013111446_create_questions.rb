class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :best_answer 
      t.integer :user_id
      t.references :commentable, polymorphic: true, index: true
      t.references :voteable, polymorphic: true, index: true

      t.timestamps(null: false)
    end
  end
end
