class CreateYears < ActiveRecord::Migration[5.0]
  def change
    create_table :years do |t|
      t.integer :year, limit: 2, null: false
      t.index :year
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
