class TranslinksController < ApplicationController

  before_filter :signed_in_user

  def new
    @translink = Translink.new
  end

  def show
      @translink = Translink.find(params[:id])
      @supply_site_name = SupplySite.find_by_id(@translink.supply_site_id).site.name
      @demand_site_name = DemandSite.find_by_id(@translink.demand_site_id).site.name
  end


  def create
    @translink = Translink.new(params[:translink])
    @translink.transport_quantity = 0.0
    if @translink.save
      flash[:success] = "Translink saved!"
      redirect_to(translinks_url)
    else
      render 'new'
    end
  end

  def edit
    @translink = Translink.find(params[:id])
  end

  def update
    @translink = Translink.find(params[:id])

    if @translink.update_attributes(params[:translink])
      flash[:success] = "Update successful!"
      redirect_to(translinks_url)
    else
      render 'edit'
    end
  end

  def destroy
    @translink = Translink.find(params[:id])
    @translink.destroy
    flash[:success] = "Translink destroyed."
    redirect_to(translinks_url)
  end

  def index
    @translinks = Translink.all
  end

  def delete_solution

    if File.exist?("Transportmengen_v2.txt")
      File.delete("Transportmengen_v2.txt")
    end

    @translinks = Translink.all
    @translinks.each { |li|
      li.transport_quantity=0.0
      li.save
    }
    @objective_function_value=nil
    flash[:success] = "Solution destroyed!"
    redirect_to current_user
  end



  def optimize
    if File.exist?("Transportmodell_v3_Input_Instanz1.inc")
      File.delete("Transportmodell_v3_Input_Instanz1.inc")
    end

    f=File.new("Transportmodell_v3_Input_Instanz1.inc", "w")

    printf(f, "set i / \n")
    @supply_sites = SupplySite.all
    @supply_sites.each { |ssi| printf(f, "i" + ssi.id.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "j / \n")
    @demand_sites = DemandSite.all
    @demand_sites.each { |dsi| printf(f, "j" + dsi.id.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "l / \n")
    @translinks = Translink.all
    @translinks.each { |li| printf(f, "l" + li.id.to_s + "\n") }
    printf(f, "/;" + "\n\n")

    printf(f, "LI(l,i) = no;\n")
    printf(f, "LJ(l,j) = no;\n\n")

    @translinks.each do |li|
      printf(f, "LI( 'l" + li.id.to_s + "', 'i" + li.supply_site_id.to_s + "') = yes;\n")
      printf(f, "LJ( 'l" + li.id.to_s + "', 'j" + li.demand_site_id.to_s + "') = yes;\n\n")
    end
    printf(f, "\n\n")

    printf(f, "Parameter\n  A(i) /\n")

    @supply_sites.each { |so| printf(f, "i" + so.id.to_s + "  " + so.supply_quantity.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nN(j) /\n")

    @demand_sites.each { |si| printf(f, "j" + si.id.to_s + "  " + si.demand_quantity.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nc(l) /\n")

    @translinks.each { |li| printf(f, "l" + li.id.to_s + "  " + li.unit_cost.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, ";\n")
    f.close


    if File.exist?("Transportmengen_v2.txt")
      File.delete("Transportmengen_v2.txt")
    end

    system "C:\\GAMS\\win64\\24.1\\gams Transportmodell_v2"

    flash[:success] = "Optimization started!"
    redirect_to current_user

  end

  def read_transportation_quantities

    if File.exist?("Transportmengen_v2.txt")

      fi=File.open("Transportmengen_v2.txt", "r")
      line=fi.readline
      sa=line.split(" ")
      @objective_function_value=sa[1]
      fi.each { |line| # printf(f,line)
        sa=line.split(";")
        sa0=sa[0].delete "l "
        sa3=sa[3].delete " \n"
        al=Translink.find_by_id(sa0)
        al.transport_quantity=sa3
        al.save
      }
      fi.close

      @translinks = Translink.all

      render "translinks/index"

    else
      flash.now[:not_available] = "Problem not solved!"
      @translinks = Translink.all
      redirect_to translinks_url
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
