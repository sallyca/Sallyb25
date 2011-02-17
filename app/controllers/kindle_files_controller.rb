class KindleFilesController < ApplicationController

  def index
    @kindle_files = KindleFile.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @kindle_files }
    end
  end

  def create
    @kindle_file = KindleFile.create(params[:kindle_file])
    @clips = KindleFile.parse(@kindle_file.text.url)
    
    respond_to do |format|
      format.html # create.html.erb
      format.xml { render :xml => @kindle_file }
    end
  end
end
