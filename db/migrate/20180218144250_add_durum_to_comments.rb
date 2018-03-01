class AddDurumToComments < ActiveRecord::Migration
  def change
    add_column :comments, :durum, :string
  end
end
