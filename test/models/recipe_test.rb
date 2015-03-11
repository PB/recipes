require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(chefname: "Roman", email: "romanek@mailinator.com")
    @recipe = @chef.recipes.build(name: "Schabowy", 
                         summary: "Dobre żarcie", 
                         description: "Wrzucić na patelnię kawałek schabu i smażyć")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "name sholud be present" do
    @recipe.name = ""
    assert_not @recipe.valid?
  end
  
  test "name length should not be longer than 250 chars" do
    @recipe.name = 'a' * 300
    assert_not @recipe.valid?
  end
  
  test "name length should not be shorter than 5 chars" do
    @recipe.name = 'a'
    assert_not @recipe.valid?
  end
  
  test "summary sholud be present" do
    @recipe.summary = ""
    assert_not @recipe.valid?
  end
  
    test "summary length should not be longer than 350 chars" do
    @recipe.summary = 'a' * 400
    assert_not @recipe.valid?
  end
  
  test "summary length should not be shorter than 10 chars" do
    @recipe.summary = 'a'
    assert_not @recipe.valid?
  end
  
  test "description sholud be present" do
    @recipe.description = ""
    assert_not @recipe.valid?
  end
  
    test "description length should not be longer than 3000 chars" do
    @recipe.description = 'a' * 4000
    assert_not @recipe.valid?
  end
  
  test "description length should not be shorter than 10 chars" do
    @recipe.description = 'a'
    assert_not @recipe.valid?
  end
  
  test "should not save recipe without name" do
    recipe = Recipe.new
    assert_not recipe.save 
  end
  
  test "chef should be present" do
    @recipe.chef = nil
    assert_not @recipe.valid?
  end
end