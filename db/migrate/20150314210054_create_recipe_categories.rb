class CreateRecipeCategories < ActiveRecord::Migration
  def change
    create_table :recipe_categories do |t|
      t.references :recipe, index: true
      t.references :category, index: true
    end
    add_foreign_key :recipe_categories, :recipes
    add_foreign_key :recipe_categories, :categories
  end
end
