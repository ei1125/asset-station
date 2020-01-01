class CreateIncomes < ActiveRecord::Migration[5.0]
  def change
    create_table :incomes do |t|
      t.string :item, null:false
      t.integer :cf, null:false
      t.references :month, foreign_key: true
      t.timestamps
    end
  end
end
