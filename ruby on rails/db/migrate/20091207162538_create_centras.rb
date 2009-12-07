class CreateCentras < ActiveRecord::Migration
  def self.up
    create_table :centras do |t|
      t.string :pavadinimas
      t.integer :vietu_skaicius
      t.integer :ligoniu_skaicius
      t.has_many :kosmonautas

      t.timestamps
    end
  end

  def self.down
    drop_table :centras
  end
end
