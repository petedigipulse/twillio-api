class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :user
      t.string :outgoing
      t.string :incoming
      t.string :mobile
      t.string :landline
      t.string :local
      t.string :regional
      t.string :international

      t.timestamps null: false
    end
  end
end
