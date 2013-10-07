class RadarsController < ApplicationController
  def index
    @radars = current_user.radars
  end

  def new
    @radar = current_user.radars.build
  end

  def create
    url = params[:radar].delete(:etsy_url)
    if url
      params[:radar][:shop_id] = Etsy::Shop.find(url.split('/').last).id
    end

    @radar = current_user.radars.build(radar_params)
    unless @radar.save
      flash[:error] = "Oops, something went wrong ;("
      render :new
    end
    flash[:notice] = "New radar created and scanning!"
    redirect_to :action => :index
  end

  def destroy
    Radar.destroy(params[:id])
    flash[:notice] = "Radar deleted"
    redirect_to :action => :index
  end

  def poll
    @radar = current_user.radars.where(:id => params[:id]).first
    @radar.poll
    redirect_to :action => :index
  end

  private

  def radar_params
    params.require(:radar).permit(:etsy_url, :user_id, :store_id, :shop_id)
  end
end
