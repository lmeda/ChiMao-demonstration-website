class AddViewsToShowcases < ActiveRecord::Migration[6.0]
  def change
    add_column :showcases, :views, :integer, default: 0
  end
end
