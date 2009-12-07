class CreateKosmonautas < ActiveRecord::Migration
  def self.up
    create_table :kosmonautas do |t|
      t.string :vardas
      t.string :pavarde
      t.date :gimimo_data
      t.string :lytis
      t.string :vieta
      t.integer :bukle
      t.belongs_to :erdvelaivis
      t.belongs_to :stotis
      t.belongs_to :centras

      t.timestamps
    end
  end

  def self.down
    drop_table :kosmonautas
  end
end
