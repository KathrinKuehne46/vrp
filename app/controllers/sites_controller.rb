class SitesController < ApplicationController

  before_filter :signed_in_user

  def new
    @site = Site.new
  end

  def index
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:id])
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])

    if @site.update_attributes(params[:site])
      flash[:success] = "Update successful!"
      redirect_to sites_path
    else
      render 'edit'
    end
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    flash[:success] = "Site destroyed."
    redirect_to sites_path
  end

  def create
    @site = Site.new(params[:site])

    if @site.save
      flash[:success] = "Site saved!"
      redirect_to sites_path
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
