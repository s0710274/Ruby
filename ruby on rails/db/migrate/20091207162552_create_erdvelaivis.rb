class CreateErdvelaivis < ActiveRecord::Migration
  def self.up
    create_table :erdvelaivis do |t|
      t.string :modelis
      t.date :pagaminimo_data
      t.integer :vietos
      t.integer :greitis
      t.string :busena
      t.float :kuro_sanaudos
      t.has_many :kosmonautas

      t.timestamps
    end
  end

  def self.down
    drop_table :erdvelaivis
  end
end
