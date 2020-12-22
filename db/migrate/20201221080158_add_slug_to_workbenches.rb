class AddSlugToWorkbenches < ActiveRecord::Migration[6.0]
  def change
    add_column :workbenches, :slug, :string
    add_index :workbenches, :slug, unique: true
  end
end
