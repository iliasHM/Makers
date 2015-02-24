class Machine < ActiveRecord::Base
  belongs_to :category
  belongs_to :brand
  belongs_to :machine_model
end
