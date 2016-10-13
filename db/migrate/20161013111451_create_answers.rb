class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :title
      t.string :content
      t.references :commentable, polymorphic: true, index: true
      t.references :voteable, polymorphic: true, index: true
      t.timestamps(null: false)
    end
  end
end
