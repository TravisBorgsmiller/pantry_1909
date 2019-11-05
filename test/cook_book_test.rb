require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'

class CookBookTest < MiniTest::Test

  def test_does_cookbook_exist

    cookbook = CookBook.new
    assert_instance_of CookBook, cookbook
  end

  def test_does_cookbook_add_recipe

    cookbook = CookBook.new
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    ground_beef = Ingredient.new("Ground Beef", "oz", 100)
    bun = Ingredient.new("Bun", "g", 1)
    burger = Recipe.new("Burger")
    burger.add_ingredient(ground_beef, 4)
    burger.add_ingredient(bun, 100)
    cookbook.add_recipe(mac_and_cheese)
    cookbook.add_recipe(burger)
    assert_equal [mac_and_cheese, burger], cookbook.recipes
  end

  def test_does_summary_method_work

    cookbook = CookBook.new
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    ground_beef = Ingredient.new("Ground Beef", "oz", 100)
    bun = Ingredient.new("Bun", "g", 1)
    burger = Recipe.new("Burger")
    burger.add_ingredient(ground_beef, 4)
    burger.add_ingredient(bun, 100)
    cookbook.add_recipe(mac_and_cheese)
    cookbook.add_recipe(burger)
    cookbook.ingredients_sort
    assert cookbook.summary.kind_of?(Array)
  end

end
