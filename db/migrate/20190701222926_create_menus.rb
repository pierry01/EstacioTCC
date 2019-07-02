class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :title
      t.text :description
      t.integer :price, default: 0

      t.timestamps
    end
  end
end
