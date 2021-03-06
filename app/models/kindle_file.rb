require 'kindleclippings'
require 'yaml'
require 'paperclip'

class KindleFile < ActiveRecord::Base
  attr_accessor :text_file_name
  has_attached_file :text,
                    :storage        => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path           => ":attachment/:id/:style.:extension",
                    :bucket         => 'szkolka'


  def self.save(upload)
    name      = upload['datafile'].original_filename
    directory = "public/data"
    # create the file path
    path      = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
    @kindle_file         = KindleFile.new
    @kindle_file.contents=path

    return @kindle_file
  end

  def self.parse_local(kindle_file_name)
    @parser              = KindleClippings::Parser.new
    @clips               =@parser.parse_file(kindle_file_name)
    return @clips
  end

  def self.parse(kindle_file_name)
    @parser = KindleClippings::Parser.new
    @clips  =@parser.parse_url(kindle_file_name)
    return @clips
  end

end
