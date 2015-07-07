class CreateNumbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
      t.integer :number
      t.string :mobile
      t.string :landline

      t.timestamps null: false
    end
  end
end
