class SupplySitesController < ApplicationController

    before_filter :signed_in_user

    def new
      @supply_site = SupplySite.new
    end

    def index
      @supply_sites = SupplySite.all
    end

    def update
      @supply_site = SupplySite.find(params[:id])

      if @supply_site.update_attributes(params[:supply_site])
        flash[:success] = "Update successful!"
        redirect_to(supply_sites_path)
      else
        render 'edit'
      end
    end

    def destroy
      @supply_site = SupplySite.find(params[:id])
      @supply_site.destroy
      flash[:success] = "Supply Site destroyed."
      redirect_to supply_sites_path
    end

    def edit
      @supply_site = SupplySite.find(params[:id])
    end

    def show
      @supply_site = SupplySite.find(params[:id])
    end

    def create
      @supply_site = SupplySite.new(params[:supply_site])

      if @supply_site.save
        flash[:success] = "Supply Site saved!"
        redirect_to supply_sites_path
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
