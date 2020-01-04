class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :item, null:false, index: true
      t.integer :cf
      t.references :user, foreign_key: true
      t.references :month, foreign_key: true
      t.timestamps
    end
  end
end
