class Machine < ActiveRecord::Base
  belongs_to :machine_model
  belongs_to :workshop

  has_one    :category, through: :machine_model
  has_one    :brand, through: :machine_model

  has_many   :machine_materials, dependent: :destroy
  has_many   :materials, through: :machine_materials
  has_many   :orders

  validates  :machine_model_id, presence: true
  validates  :workshop_id, presence: true

  accepts_nested_attributes_for :machine_materials

  def name
    "#{machine_model.name} - #{brand.name} - #{category.name}"
  end
end
