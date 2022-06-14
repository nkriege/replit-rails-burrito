class Order < ApplicationRecord
  belongs_to :meat, optional: true

  BEANS = %w[Black Pinto None].freeze
  RICE = %w[White Brown None].freeze
  TORTILLAS = %w[Corn Flour Wheat None].freeze

  TOPPINGS_ATTRS = %w[cheese lettuce guacamole salsa sour_cream].freeze

  validates :name_first, presence: true
  validates :name_last, presence: true

  validates :beans, inclusion: BEANS, allow_nil: true
  validates :rice, inclusion: RICE, allow_nil: true
  validates :tortilla, inclusion: TORTILLAS, allow_nil: true

  # Need valid address on delivery orders
  validates(:address_street1,
            :address_zip,
            :address_city,
            :address_state,
            presence: true,
            if: :delivery)

  #
  # toppings accessors
  #

  # toppings as array of strings
  def toppings
    TOPPINGS_ATTRS.select { self[_1] }.map(&:titleize).sort
  end

  # set toppings as an array of strings
  def toppings=(arr)
    arr = (arr || []).map { _1.parameterize(separator: '_') }
    TOPPINGS_ATTRS.each { self[_1] = arr.include?(_1) }
  end
end
