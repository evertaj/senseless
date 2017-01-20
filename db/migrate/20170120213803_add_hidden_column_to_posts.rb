class AddHiddenColumnToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :hidden, :boolean, default: false
    remove_column :posts, :description
  end
end
