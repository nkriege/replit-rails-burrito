class CreateFillings < ActiveRecord::Migration[7.0]
  def change
    create_table :fillings do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.decimal :price, precision: 5, scale: 2, null: false
      t.integer :calories, null: false
      t.boolean :available, null: false, default: false

      t.timestamps
    end
  end
end
