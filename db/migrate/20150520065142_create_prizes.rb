class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.integer :user_id
      t.text :results
      t.integer :totalNum

      t.string :firstName
      t.string :firstTitle
      t.string :firstDescription
      t.integer :firstNum

      t.string :secondName
      t.string :secondTitle
      t.string :secondDescription
      t.integer :secondNum

      t.timestamps
    end
  end
end
