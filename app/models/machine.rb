class Machine < ActiveRecord::Base
  belongs_to :machine_model
  belongs_to :maker, class_name: "User", foreign_key: :user_id

  has_one    :category, through: :machine_model
  has_one    :brand, through: :machine_model

  has_many   :machine_materials, dependent: :destroy, inverse_of:  :machine
  has_many   :materials, through: :machine_materials

  validates  :machine_model_id, presence: true
  validates  :user_id, presence: true

  accepts_nested_attributes_for :machine_materials

  def name
    "#{machine_model.name} - #{brand.name} - #{category.name}"
  end
end
