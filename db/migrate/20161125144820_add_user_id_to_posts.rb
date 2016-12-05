class AddUserIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :user_id, :integer
    remove_column :posts, :author_name, :string 
  end
end
