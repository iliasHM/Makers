class MachineMaterial < ActiveRecord::Base
  belongs_to :machine, inverse_of: :machine_materials
  belongs_to :material

  validates :colors, presence: true

  def name
    "#{colors}"
  end
end
