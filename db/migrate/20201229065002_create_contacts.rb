class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :title
      t.text :description
      t.string :name
      t.string :company
      t.string :address
      t.string :zip
      t.string :phone
      t.string :fax
      t.string :email

      t.timestamps
    end
  end
end
