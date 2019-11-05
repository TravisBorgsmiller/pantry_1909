class CookBook

  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients_sort
    @recipes.each do |recipe|
      recipe.ingredients_required.keys.sort_by
      ingredient.calories
    end
  end

end
