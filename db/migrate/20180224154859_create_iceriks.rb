class CreateIceriks < ActiveRecord::Migration
  def change
    create_table :iceriks do |t|
      t.string :mbs
      t.string :saat
      t.string :lig
      t.string :kod
      t.string :mac
      t.string :oran1
      t.string :oran2
      t.string :oran3
      t.string :oran4
      t.string :oran5
      t.string :oran6
      t.string :oran7
      t.string :oran8
      t.string :oran9
      t.string :oran10
      t.string :oran11
      t.string :oran12
      t.string :oran13
      t.string :oran14
      t.string :oran15
      t.string :oran16
      t.string :oran17
      t.string :oran18
      t.string :oran19
      t.string :oran20

      t.timestamps null: false
    end
  end
end
