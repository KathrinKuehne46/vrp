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

require 'spec_helper'

describe Translink do
  pending "add some examples to (or delete) #{__FILE__}"
end
