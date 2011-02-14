class CreateClippings < ActiveRecord::Migration
  def self.up
    create_table :clippings do |t|
      t.string :book
      t.string :author
      t.string :location
      t.timestamp :date
      t.text :quote

      t.timestamps
    end
  end

  def self.down
    drop_table :clippings
  end
end
