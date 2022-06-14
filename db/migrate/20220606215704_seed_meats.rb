class SeedMeats < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        Meat.create!(
          name: 'Chicken',
          description: 'Free-range organic chicken, grilled to perfection.',
          price: 9.00,
          calories: 180,
          available: true
        )

        Meat.create!(
          name: 'Beef',
          description: 'Organic, grass-fed beef marinated in herbs and spices.',
          price: 9.50,
          calories: 150,
          available: true
        )

        Meat.create!(
          name: 'Vegetarian',
          description: 'Peppers, onions, and greens.',
          price: 8.50,
          calories: 90,
          available: true
        )
      end
      dir.down do
        Meat.destroy_all
      end
    end
  end
end
