class AddingAuthorToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :authors, :string
  end
end
