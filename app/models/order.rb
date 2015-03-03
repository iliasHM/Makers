class Order < ActiveRecord::Base
  belongs_to :machine
  belongs_to :machine_material

  validates  :description, presence: :true
  validates  :file, presence: :true

  register_currency :eur
  monetize :price_cents, :numericality => {
    :greater_than_or_equal_to => 0,
    :less_than_or_equal_to => 10000
  }

  state_machine initial: :asking do
    state :asking          # Designer ask for price
    state :proposed_price  # Maker propose price, waits for Designer to accept
    state :accepted        # Designer accept price, Maker start order
    state :completed       # Order is complete
  end

  event :propose_price do
    transition asking: :proposed_price
  end

  event :accept do
    transition proposed_price: :accepted
  end

  event :complete do
    transition accepted: :completed
  end
end
