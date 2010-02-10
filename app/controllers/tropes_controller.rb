class TropesController < ApplicationController
  # GET /tropes
  # GET /tropes.xml
  def index
    @tropes = Trope.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tropes }
    end
  end

  # GET /tropes/1
  # GET /tropes/1.xml
  def show
    @trope = Trope.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @trope }
    end
  end

  # GET /tropes/new
  # GET /tropes/new.xml
  def new
    @trope = Trope.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @trope }
    end
  end

  # GET /tropes/1/edit
  def edit
    @trope = Trope.find(params[:id])
  end

  # POST /tropes
  # POST /tropes.xml
  def create
    @trope = Trope.new(params[:trope])

    respond_to do |format|
      if @trope.save
        flash[:notice] = 'Trope was successfully created.'
        format.html { redirect_to(@trope) }
        format.xml  { render :xml => @trope, :status => :created, :location => @trope }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @trope.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tropes/1
  # PUT /tropes/1.xml
  def update
    @trope = Trope.find(params[:id])

    respond_to do |format|
      if @trope.update_attributes(params[:trope])
        flash[:notice] = 'Trope was successfully updated.'
        format.html { redirect_to(@trope) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @trope.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tropes/1
  # DELETE /tropes/1.xml
  def destroy
    @trope = Trope.find(params[:id])
    @trope.destroy

    respond_to do |format|
      format.html { redirect_to(tropes_url) }
      format.xml  { head :ok }
    end
  end
end
