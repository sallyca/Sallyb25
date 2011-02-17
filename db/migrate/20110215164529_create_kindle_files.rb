class CreateKindleFiles < ActiveRecord::Migration
  def self.up
    create_table :kindle_files do |t|
      t.text :contents
      t.text :wikimarkup
      t.timestamps
    end

    add_column :kindle_files, :text_file_name, :string
    add_column :kindle_files, :text_content_type, :string
    add_column :kindle_files, :text_file_size, :integer

  end

  def self.down
    remove_column :kindle_files, :text_file_name, :string
    remove_column :kindle_files, :text_content_type, :string
    remove_column :kindle_files, :text_file_size, :integer
    drop_table :kindle_files

  end
end
