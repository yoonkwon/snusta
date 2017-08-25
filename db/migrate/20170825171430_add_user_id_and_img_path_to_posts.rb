class AddUserIdAndImgPathToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :user, after: :id
    add_column :posts, :img_path, :string, after: :content
    remove_column :posts, :text, :string
  end
end
