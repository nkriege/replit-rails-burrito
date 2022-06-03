class Order < ApplicationRecord
  belongs_to :filling

  BEANS = %w[Black Pinto None].freeze
  RICE = %w[White Brown None].freeze
  TORTILLAS = %w[Corn Flour Bowl].freeze

  TOPPINGS_ATTRS = %w[cheese lettuce guacamole salsa sour_cream].freeze

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true

  validates :beans, presence: true, inclusion: BEANS
  validates :rice, presence: true, inclusion: RICE
  validates :tortilla, presence: true, inclusion: TORTILLAS

  # Need valid address on delivery orders
  validates(:delivery_street1,
            :delivery_zip,
            :delivery_city,
            :delivery_state,
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
