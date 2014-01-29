class SupplySite < ActiveRecord::Base
  attr_accessible :supply_quantity, :site_id
  validates :supply_quantity, :numericality => { :greater_than => 0}

  belongs_to :site
  has_many :translinks, :dependent => :destroy

  def supply_site_codename
    self.site.codename
  end
end