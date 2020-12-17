class CreateShowcases < ActiveRecord::Migration[6.0]
  def change
    create_table :showcases do |t|
      t.string :title
      t.string :model_number
      t.text :description
      t.string :product
      t.string :specification
      t.integer :category_id

      t.timestamps
    end
  end
end
