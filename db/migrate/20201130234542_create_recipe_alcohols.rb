class CreateRecipeAlcohols < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_alcohols do |t|
      t.integer :recipe_id
      t.integer :alcohol_id

      t.timestamps
    end
  end
end
