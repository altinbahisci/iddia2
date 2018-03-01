class AddSumToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :sum, :float
  end
end
