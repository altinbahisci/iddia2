class AddBakiyeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :bakiye, :float
  end
end
