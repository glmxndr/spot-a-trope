class OperaController < ApplicationController
  # GET /opera
  # GET /opera.xml
  def index
    @opera = Opus.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @opera }
    end
  end


  def starred
    @opus = Opus.find(params[:id])
    @tocentries = Tocentry.all(:conditions => { :opus_id => @opus.id, :starred => true} )
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tocentries }
    end   
  end

  # GET /opera/1
  # GET /opera/1.xml
  def show
    @opus = Opus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @opus }
    end
  end

  # GET /opera/new
  # GET /opera/new.xml
  def new
    @opus = Opus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @opus }
    end
  end

  # GET /opera/1/edit
  def edit
    @opus = Opus.find(params[:id])
  end

  # POST /opera
  # POST /opera.xml
  def create
    @opus = Opus.new(params[:opus])

    respond_to do |format|
      if @opus.save
        flash[:notice] = 'Opus was successfully created.'
        format.html { redirect_to(@opus) }
        format.xml  { render :xml => @opus, :status => :created, :location => @opus }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @opus.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /opera/1
  # PUT /opera/1.xml
  def update
    @opus = Opus.find(params[:id])

    respond_to do |format|
      if @opus.update_attributes(params[:opus])
        flash[:notice] = 'Opus was successfully updated.'
        format.html { redirect_to(@opus) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @opus.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /opera/1
  # DELETE /opera/1.xml
  def destroy
    @opus = Opus.find(params[:id])
    @opus.destroy

    respond_to do |format|
      format.html { redirect_to(opera_url) }
      format.xml  { head :ok }
    end
  end
end
