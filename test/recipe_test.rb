require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < MiniTest::Test

  def test_does_recipe_exist

    mac_and_cheese = Recipe.new("Mac and Cheese")
    assert_instance_of Recipe, mac_and_cheese
  end


end
