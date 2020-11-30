class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.integer :cocktail_id
      t.string :ingredients

      t.timestamps
    end
  end
end
