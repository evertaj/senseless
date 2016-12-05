class AddAuthorNameToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :author_name, :string
  end
end
