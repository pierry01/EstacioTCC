class AddMenuToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :menu, foreign_key: true
  end
end
