class AddMacToComments < ActiveRecord::Migration
  def change
    add_column :comments, :mac, :string
  end
end
