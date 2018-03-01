class AddMbsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :mbs, :string
  end
end
