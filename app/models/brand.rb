class Brand < ActiveRecord::Base
  has_many :machine_models, dependent: :destroy

  validates :name, presence: true
end
