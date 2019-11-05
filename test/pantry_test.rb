require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < MiniTest::Test

  def test_does_pantry_exist

    pantry = Pantry.new
    assert_instance_of Pantry, pantry
  end

  def test_does_pantry_return_stock

    pantry = Pantry.new
    expected = {}
    assert_equal expected, pantry.stock
  end

  def test_does_pantry_check_stock

    pantry = Pantry.new
    mac_and_cheese = Recipe.new("Mac and Cheese")
    cheese = Ingredient.new("Cheese", "C", 50)
    mac = Ingredient.new("Macaroni", "oz", 200)
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    assert_equal 0, pantry.stock_check(cheese)
  end

  def test_does_pantry_restock

    pantry = Pantry.new
    mac_and_cheese = Recipe.new("Mac and Cheese")
    cheese = Ingredient.new("Cheese", "C", 50)
    mac = Ingredient.new("Macaroni", "oz", 200)
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    pantry.restock(cheese, 5)
    pantry.restock(cheese, 10)
    assert_equal 15, pantry.stock_check(cheese)
  end

  def test_does_pantry_have_enough_ingredients_for_a_given_recipe

    pantry = Pantry.new
    mac_and_cheese = Recipe.new("Mac and Cheese")
    cheese = Ingredient.new("Cheese", "C", 50)
    mac = Ingredient.new("Macaroni", "oz", 200)
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    refute pantry.enough_ingredients_for?(mac_and_cheese)
    pantry.restock(mac, 7)
    refute pantry.enough_ingredients_for?(mac_and_cheese)
    pantry.restock(mac, 1)
    assert pantry.enough_ingredients_for?(mac_and_cheese)
  end

end
