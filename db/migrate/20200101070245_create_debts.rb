class CreateDebts < ActiveRecord::Migration[5.0]
  def change
    create_table :debts do |t|
      t.string :item, null:false
      t.integer :money, null:false
      t.float :rate
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
