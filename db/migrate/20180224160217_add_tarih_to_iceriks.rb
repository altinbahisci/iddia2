class AddTarihToIceriks < ActiveRecord::Migration
  def change
    add_column :iceriks, :tarih, :string
  end
end