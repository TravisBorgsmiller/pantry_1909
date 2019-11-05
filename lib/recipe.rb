class Recipe

  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient_name, amount)
    @ingredients_required[ingredient_name] = amount
  end

  def amount_required(ingredient)
    amount_required_for_ingredient = nil
    @ingredients_required.each do |ingredient_name, amount|
      if ingredient_name == ingredient
        amount_required_for_ingredient = amount
      end
    end
    amount_required_for_ingredient
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    calories = 0
    @ingredients_required.each do |ingredient, amount|
      calories += ingredient.calories * amount
    end
    calories
  end

end
