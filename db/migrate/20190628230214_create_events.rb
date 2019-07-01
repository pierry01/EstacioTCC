class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start
      t.datetime :finish

      t.timestamps
    end
  end
end
