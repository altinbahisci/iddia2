class AddBakiyeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bakiye, :float
  end
end
