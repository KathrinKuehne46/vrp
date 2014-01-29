# == Schema Information
#
# Table name: translinks
#
#  id                 :integer          not null, primary key
#  supplysite_id      :integer
#  demandsite_id      :integer
#  unit_cost          :float
#  transport_quantity :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Translink < ActiveRecord::Base
  attr_accessible :demand_site_id, :supply_site_id, :transport_quantity, :unit_cost
  validates :transport_quantity, :numericality => { :greater_than_or_equal_to => 0}
  validates :unit_cost, :numericality => { :greater_than_or_equal_to => 0}

  belongs_to :supply_site
  belongs_to :demand_site
end
