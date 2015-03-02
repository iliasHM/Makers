class Category < ActiveRecord::Base
  has_many :machine_models, dependent: :destroy

  has_attached_file :icon,
    styles: { medium: "300x300>", little: "200x200>", thumb: "100x100>" }

  validates_attachment_content_type :icon,
    content_type: /\Aimage\/.*\z/

  validates :name, presence: true
end
