class DemandSite < ActiveRecord::Base
  attr_accessible :demand_quantity, :site_id
  validates :demand_quantity, :numericality => { :greater_than => 0}

  belongs_to :site
  has_many :translinks, :dependent => :destroy
#  accepts_nested_attributes_for :translinks

  def demand_site_codename
    self.site.codename
  end

end