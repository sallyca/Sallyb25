class CreateKindleFiles < ActiveRecord::Migration
  def self.up
    create_table :kindle_files do |t|
      t.text :contents
      t.timestamps
    end
  end

  def self.down
    drop_table :kindle_files
  end
end
