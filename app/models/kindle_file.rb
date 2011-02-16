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
    logger.info 'kindle file contents:'+@kindle_file.contents
  end


end
