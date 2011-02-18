class KindleFilesController < ApplicationController

  def index
    @kindle_files = KindleFile.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @kindle_files }
    end
  end

  def upload
    @kindle_file         = KindleFile.create(params[:kindle_file])
    @kindle_file.contents=@kindle_file.text.url
    @clips               = KindleFile.parse(@kindle_file.text.url)

#    @kindle_file = KindleFile.save(params[:upload])
#    @clips = KindleFile.parse_local(@kindle_file.contents)
      @book_list=@clips.parse_books
    @kindle_file.save

    respond_to do |format|
      format.html # upload.html.erb
      format.xml { render :xml => @kindle_file }
    end
  end

  def parse

#    @clips = KindleFile.parse_local(params[:s3_url])

    @clips       = KindleFile.parse(params[:s3_url]).book_list
    @book_list= KindleFile.parse(params[:s3_url]).parse_books
    @kindle_file = KindleFile.find(params[:id])
#
    respond_to do |format|
      format.html # upload.html.erb
      format.xml { render :xml => @kindle_file }
    end
  end

  def destroy
    @kindle_file = KindleFile.find(params[:id])
    @kindle_file.destroy

    respond_to do |format|
      format.html { redirect_to(kindle_file_url, :notice=>"Dude, you've just deleted a file.") }
      format.xml { head :ok }
    end
  end
end
