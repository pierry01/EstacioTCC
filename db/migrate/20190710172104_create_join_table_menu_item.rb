class CreateJoinTableMenuItem < ActiveRecord::Migration[6.0]
  def change
    create_join_table :items, :menus do |t|
      t.index [:item_id, :menu_id]
      t.index [:menu_id, :item_id]
    end
  end
end
