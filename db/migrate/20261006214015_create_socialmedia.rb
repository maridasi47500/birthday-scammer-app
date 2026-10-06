class CreateSocialmedia < ActiveRecord::Migration[8.1]
  def change
    create_table :socialmedia do |t|
      t.string :name

      t.timestamps
    end
  end
end
