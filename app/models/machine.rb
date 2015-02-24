class Machine < ActiveRecord::Base
  belongs_to :machine_model
  belongs_to :maker, class_name: "User", foreign_key: :user_id

  has_one :category, through: :machine_model
  has_one :brand, through: :machine_model

  has_and_belongs_to_many :materials

  validates :machine_model_id, presence: true
  validates :user_id, presence: true
end
