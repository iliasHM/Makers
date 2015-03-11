class Material < ActiveRecord::Base
  has_many :machine_materials
  has_many :machines, through: :machine_materials

  validates :name, presence: true

end