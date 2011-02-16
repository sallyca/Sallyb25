class KindleFilesController < ApplicationController

  def index
    @kindle_files = KindleFile.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @kindle_files }
    end
  end

  def upload
    @kindle_files=KindleFile.all
    @clips = KindleFile.save(params[:upload])
    
    respond_to do |format|
      format.html # upload.html.erb
      format.xml { render :xml => @kindle_file }
    end
  end
end
