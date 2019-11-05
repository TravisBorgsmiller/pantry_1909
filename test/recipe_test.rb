require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < MiniTest::Test

  def test_does_recipe_exist

    mac_and_cheese = Recipe.new("M ac and Cheese")
    assert_instance_of Recipe, mac_and_cheese
  end

  def test_does_recipe_initialize

    mac_and_cheese = Recipe.new("Mac and Cheese")
    assert_equal "Mac and Cheese", mac_and_cheese.name
  end

  def test_does_recipe_add_required_ingredients

    mac_and_cheese = Recipe.new("Mac and Cheese")
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    expected = {}
    assert_equal expected, mac_and_cheese.ingredients_required
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    assert_equal [2, 8], mac_and_cheese.ingredients_required.values
  end

  def test_does_recipe_return_individual_ingredient_required_amount

    mac_and_cheese = Recipe.new("Mac and Cheese")
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    assert_equal 2, mac_and_cheese.amount_required(cheese)
    assert_equal 8, mac_and_cheese.amount_required(mac)
  end

  def test_does_recipe_list_ingredients

    mac_and_cheese = Recipe.new("Mac and Cheese")
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    assert_equal [cheese, mac], mac_and_cheese.ingredients
  end

  def test_does_recipe_return_total_calories

    mac_and_cheese = Recipe.new("Mac and Cheese")
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    assert_equal 440, mac_and_cheese.total_calories
  end

end
