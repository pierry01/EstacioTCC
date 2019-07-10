class AddItemsToMenu < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :menu, foreign_key: true
  end
end
