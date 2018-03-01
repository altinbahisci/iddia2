class AddTutarToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :tutar, :float
  end
end
