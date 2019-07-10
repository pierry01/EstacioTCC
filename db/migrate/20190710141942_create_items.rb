class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
