require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require './lib/ingredient'

class IngredientTest < MiniTest::Test

  def test_does_ingredient_exist

    cheese = Ingredient.new("Cheese", "oz", 50)
    assert_instance_of Ingredient, cheese
  end

  def test_does_ingredient_initialize

    cheese = Ingredient.new("Cheese", "oz", 50)
    assert_equal "Cheese", cheese.name
    assert_equal "oz", cheese.unit
    assert_equal 50, cheese.calories
  end 

end
