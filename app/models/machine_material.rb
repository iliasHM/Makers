class MachineMaterial < ActiveRecord::Base
  belongs_to :machine
  belongs_to :material

  validates :colors, presence: true

end
