class AddProductToComments < ActiveRecord::Migration
  def change
    add_column :comments, :product, :float
  end
end
