class AddOnayToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :onay, :integer
  end
end
