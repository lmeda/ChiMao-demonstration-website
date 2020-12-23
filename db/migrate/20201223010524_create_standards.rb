class CreateStandards < ActiveRecord::Migration[6.0]
  def change
    create_table :standards do |t|
      t.string :title
      t.string :model_number
      t.integer :capacity
      t.string :voltage
      t.string :temperature
      t.string :compressor
      t.text :annex
      t.integer :category_id

      t.timestamps
    end
  end
end
