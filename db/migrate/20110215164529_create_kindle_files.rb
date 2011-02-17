class CreateKindleFiles < ActiveRecord::Migration
  def self.up
    create_table :kindle_files do |t|
      t.text :contents
      t.text :wikimarkup
      t.string :s3_url

      t.timestamps
    end

    add_column :kindle_files, :s3_url, :string
    add_column :kindle_files, :text_file_name, :string
    add_column :kindle_files, :text_content_type, :string
    add_column :kindle_files, :text_file_size, :integer

  end

  def self.down
    drop_table :kindle_files
  end
end
