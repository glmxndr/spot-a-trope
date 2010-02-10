class TocentriesController < ApplicationController
  # GET /tocentries
  # GET /tocentries.xml
  def index
    @tocentries = Tocentry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tocentries }
    end
  end

  # GET /tocentries/1
  # GET /tocentries/1.xml
  def show
    @tocentry = Tocentry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tocentry }
    end
  end

  # GET /tocentries/new
  # GET /tocentries/new.xml
  def new
    @tocentry = Tocentry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tocentry }
    end
  end

  # GET /tocentries/1/edit
  def edit
    @tocentry = Tocentry.find(params[:id])
  end

  # POST /tocentries
  # POST /tocentries.xml
  def create
    @tocentry = Tocentry.new(params[:tocentry])

    respond_to do |format|
      if @tocentry.save
        flash[:notice] = 'Tocentry was successfully created.'
        format.html { redirect_to(@tocentry) }
        format.xml  { render :xml => @tocentry, :status => :created, :location => @tocentry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tocentry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tocentries/1
  # PUT /tocentries/1.xml
  def update
    @tocentry = Tocentry.find(params[:id])

    respond_to do |format|
      if @tocentry.update_attributes(params[:tocentry])
        flash[:notice] = 'Tocentry was successfully updated.'
        format.html { redirect_to(@tocentry) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tocentry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tocentries/1
  # DELETE /tocentries/1.xml
  def destroy
    @tocentry = Tocentry.find(params[:id])
    @tocentry.destroy

    respond_to do |format|
      format.html { redirect_to(tocentries_url) }
      format.xml  { head :ok }
    end
  end
end
