class CreateSelects < ActiveRecord::Migration[5.0]
  def change
    create_table :selects do |t|
      t.string :item
      t.string :category
    end
  end
end
