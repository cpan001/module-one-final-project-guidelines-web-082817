class CreateIngredientsRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients_recipes do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :ingredient, index: true
    end
  end
end
