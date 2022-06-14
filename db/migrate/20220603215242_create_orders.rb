class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      #
      # customer info
      #

      t.string :name_first, null: false
      t.string :name_last, null: false
      t.string :email
      t.string :phone
      t.string :favorite_color

      #
      # ingredients
      #

      t.string :tortilla
      t.string :rice
      t.string :beans
      t.text :instructions

      #
      # delivery
      #

      t.boolean :delivery, null: false, default: false
      t.string :address_street1
      t.string :address_street2
      t.string :address_zip
      t.string :address_city
      t.string :address_state

      #
      # toppings
      #

      t.boolean :cheese, null: false, default: false
      t.boolean :lettuce, null: false, default: false
      t.boolean :guacamole, null: false, default: false
      t.boolean :salsa, null: false, default: false
      t.boolean :sour_cream, null: false, default: false

      #
      # associations
      #

      t.references :meat, null: true, foreign_key: false

      t.timestamps
    end
  end
end
