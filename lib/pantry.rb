class Pantry

  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient_name)
    amount_on_hand = 0
    @stock.each do |ingredient, amount|
      if ingredient_name == ingredient
        amount_on_hand = amount
      end
    end
    amount_on_hand
  end

  def restock(ingredient_name, restock_amount)
    if @stock == {}
      @stock[ingredient_name] = restock_amount
    elsif
      @stock.each do |ingredient, amount|
        new_amount = restock_amount + amount
        @stock[ingredient_name] = new_amount
      end
      @stock[ingredient_name]
    end
  end

  def enough_ingredients_for?(recipe_name)
    return_value = false
    if stock == {}
      return_value
    else
      @stock.each do |ingredient, amount|
        if recipe_name.ingredients.include?(ingredient) && amount >= recipe_name.amount_required(ingredient)
          then return_value = true
        else 
        end
      end
      return_value
    end
  end

end
