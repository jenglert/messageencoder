class PopupAdsController < ApplicationController
  # GET /popup_ads
  # GET /popup_ads.xml
  def index
    @popup_ads = PopupAd.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @popup_ads }
    end
  end

  # GET /popup_ads/1
  # GET /popup_ads/1.xml
  def show
    @popup_ad = PopupAd.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @popup_ad }
    end
  end

  # GET /popup_ads/new
  # GET /popup_ads/new.xml
  def new
    @popup_ad = PopupAd.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @popup_ad }
    end
  end

  # GET /popup_ads/1/edit
  def edit
    @popup_ad = PopupAd.find(params[:id])
  end

  # POST /popup_ads
  # POST /popup_ads.xml
  def create
    @popup_ad = PopupAd.new(params[:popup_ad])

    respond_to do |format|
      if @popup_ad.save
        flash[:notice] = 'PopupAd was successfully created.'
        format.html { redirect_to(@popup_ad) }
        format.xml  { render :xml => @popup_ad, :status => :created, :location => @popup_ad }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @popup_ad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /popup_ads/1
  # PUT /popup_ads/1.xml
  def update
    @popup_ad = PopupAd.find(params[:id])

    respond_to do |format|
      if @popup_ad.update_attributes(params[:popup_ad])
        flash[:notice] = 'PopupAd was successfully updated.'
        format.html { redirect_to(@popup_ad) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @popup_ad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /popup_ads/1
  # DELETE /popup_ads/1.xml
  def destroy
    @popup_ad = PopupAd.find(params[:id])
    @popup_ad.destroy

    respond_to do |format|
      format.html { redirect_to(popup_ads_url) }
      format.xml  { head :ok }
    end
  end
end
