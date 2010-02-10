class TropeTranslationsController < ApplicationController
  # GET /trope_translations
  # GET /trope_translations.xml
  def index
    @trope_translations = TropeTranslation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trope_translations }
    end
  end

  # GET /trope_translations/1
  # GET /trope_translations/1.xml
  def show
    @trope_translation = TropeTranslation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @trope_translation }
    end
  end

  # GET /trope_translations/new
  # GET /trope_translations/new.xml
  def new
    @trope_translation = TropeTranslation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @trope_translation }
    end
  end

  # GET /trope_translations/1/edit
  def edit
    @trope_translation = TropeTranslation.find(params[:id])
  end

  # POST /trope_translations
  # POST /trope_translations.xml
  def create
    @trope_translation = TropeTranslation.new(params[:trope_translation])

    respond_to do |format|
      if @trope_translation.save
        flash[:notice] = 'TropeTranslation was successfully created.'
        format.html { redirect_to(@trope_translation) }
        format.xml  { render :xml => @trope_translation, :status => :created, :location => @trope_translation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @trope_translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trope_translations/1
  # PUT /trope_translations/1.xml
  def update
    @trope_translation = TropeTranslation.find(params[:id])

    respond_to do |format|
      if @trope_translation.update_attributes(params[:trope_translation])
        flash[:notice] = 'TropeTranslation was successfully updated.'
        format.html { redirect_to(@trope_translation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @trope_translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trope_translations/1
  # DELETE /trope_translations/1.xml
  def destroy
    @trope_translation = TropeTranslation.find(params[:id])
    @trope_translation.destroy

    respond_to do |format|
      format.html { redirect_to(trope_translations_url) }
      format.xml  { head :ok }
    end
  end
end
