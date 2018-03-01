class AddOranToComments < ActiveRecord::Migration
  def change
    add_column :comments, :oran, :string
  end
end
