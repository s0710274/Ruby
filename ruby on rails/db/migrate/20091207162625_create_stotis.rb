class CreateStotis < ActiveRecord::Migration
  def self.up
    create_table :stotis do |t|
      t.string :pavadinimas
      t.integer :vietu_skaicius
      t.integer :ligoniu_skaicius
      t.has_many :kosmonautas

      t.timestamps
    end
  end

  def self.down
    drop_table :stotis
  end
end
