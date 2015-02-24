class Material < ActiveRecord::Base
  has_and_belongs_to_many :machines

  validates :name, presence: true
  validates :colors, presence: true

end