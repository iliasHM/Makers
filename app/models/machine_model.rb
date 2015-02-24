class MachineModel < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category

  has_many :machines, dependent: :destroy

  validates :name, presence: true
  validates :brand_id, presence: true
  validates :category_id, presence: true
end
