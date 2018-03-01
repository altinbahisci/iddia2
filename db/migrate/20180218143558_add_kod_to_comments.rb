class AddKodToComments < ActiveRecord::Migration
  def change
    add_column :comments, :kod, :string
  end
end
