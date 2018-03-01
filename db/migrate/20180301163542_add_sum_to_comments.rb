class AddSumToComments < ActiveRecord::Migration
  def change
    add_column :comments, :sum, :float
  end
end
