class CreateMonths < ActiveRecord::Migration[5.0]
  def change
    create_table :months do |t|
      t.integer :month, limit: 1, null: false
      t.index :month
      t.references :year, foreign_key: true
      t.timestamps
    end
  end
end
