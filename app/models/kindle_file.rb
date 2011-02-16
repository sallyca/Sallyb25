require 'kindleclippings'
class KindleFile < ActiveRecord::Base

  def self.save(upload)
    name      = upload['datafile'].original_filename
    directory = "public/data"
    # create the file path
    path      = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
    @kindle_file         = KindleFile.new
    @kindle_file.contents=File.open(path, "rb").read
    @parser = KindleClippings::Parser.new
    @clips=@parser.parse_file(path)
    logger.info 'kindle file contents:'+@kindle_file.contents
    return @clips
#    logger.info 'parsed:'+@clippings
#     clipping = @parser.send(:parse_clipping, input)
  end

  



end
