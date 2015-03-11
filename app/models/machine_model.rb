class MachineModel < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category

  has_many :machines, dependent: :destroy

  has_attached_file :model_picture,
    styles: { medium: "300x300>", little: "200x200>", thumb: "100x100>" }

  validates_attachment_content_type :model_picture,
    content_type: /\Aimage\/.*\z/

  validates :name, presence: true
  validates :brand_id, presence: true
  validates :category_id, presence: true
end
