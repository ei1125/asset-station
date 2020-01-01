class CreateAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :assets do |t|
      t.string :item, null:false
      t.integer :money, null:false
      t.integer :deposit
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
