class Workshop < ActiveRecord::Base
  belongs_to :maker, class_name: "User", foreign_key: :user_id
  has_many :machines

  validates  :user_id, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
