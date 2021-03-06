class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :workshop, dependent: :destroy
  has_many :machines, through: :workshop
  has_many :orders, dependent: :destroy, foreign_key: 'designer_id'
  has_many :received_orders, dependent: :destroy, foreign_key: 'maker_id', class_name: 'Order'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [ :facebook ]


  has_attached_file :picture,
    styles: { medium: "300x300>", little: "200x200>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  # validation email
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true



  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.name = auth.info.name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

  def owner_of
    array = []
    machines.each do |machine|
      array << machine.machine_model.name
    end
    array.join(', ')
  end

end


