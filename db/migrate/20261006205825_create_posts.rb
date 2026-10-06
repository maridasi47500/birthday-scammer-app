class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :pic
      t.string :title
      t.string :content
      t.references :socialmedia, null: false, foreign_key: true

      t.timestamps
    end
  end
end
