class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      #
      # required
      #

      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :tortilla, null: false
      t.string :rice, null: false
      t.string :beans, null: false
      t.boolean :delivery, null: false, default: false

      #
      # optional
      #

      t.string :delivery_street1
      t.string :delivery_street2
      t.string :delivery_zip
      t.string :delivery_city
      t.string :delivery_state
      t.text :instructions

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

      t.references :filling, null: false, foreign_key: true

      t.timestamps
    end
  end
end
