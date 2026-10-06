class CreateScams < ActiveRecord::Migration[8.1]
  def change
    create_table :scams do |t|
      t.references :post, null: false, foreign_key: true
      t.string :scammer_type
      t.string :person_name
      t.string :dateofbirth
      t.string :email
      t.string :phone
      t.string :current_place
      t.string :moreinfo
      t.string :scammerdescription

      t.timestamps
    end
  end
end
