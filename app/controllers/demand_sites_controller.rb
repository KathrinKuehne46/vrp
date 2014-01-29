class DemandSitesController < ApplicationController

  before_filter :signed_in_user

  def new
    @demand_site = DemandSite.new
  end

  def index
    @demand_sites = DemandSite.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @demand_sites }
    end
  end

  def update
    @demand_site = DemandSite.find(params[:id])

    if @demand_site.update_attributes(params[:demand_site])
      flash[:success] = "Update successful!"
      redirect_to(demand_sites_path)
    else
      render 'edit'
    end
  end

  def destroy
    @demand_site = DemandSite.find(params[:id])
    @demand_site.destroy
    flash[:success] = "Demand Site destroyed."
    redirect_to demand_sites_path
  end

  def edit
    @demand_site = DemandSite.find(params[:id])
  end

  def show
    @demand_site = DemandSite.find(params[:id])
  end

  def create
    @demand_site = DemandSite.new(params[:demand_site])

    if @demand_site.save
      flash[:success] = "Demand Site saved!"
      redirect_to demand_sites_path
    else
      render 'new'
    end
  end

private

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Bitte melden Sie sich an."
    end
  end

end
