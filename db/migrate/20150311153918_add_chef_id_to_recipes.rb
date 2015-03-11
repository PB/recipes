class AddChefIdToRecipes < ActiveRecord::Migration
  def change
    add_reference :recipes, :chef, index: true
  end
end
