class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.integer :question_id
      t.references :commentable, polymorphic: true, index: true
      t.references :voteable, polymorphic: true, index: true
      t.timestamps(null: false)
    end
  end
end
