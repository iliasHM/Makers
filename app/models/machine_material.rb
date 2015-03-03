class MachineMaterial < ActiveRecord::Base
  belongs_to :machine
  belongs_to :material

  has_many   :orders

  validates  :colors, presence: true

  def name
    "#{colors}"
  end
end
