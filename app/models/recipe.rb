class Recipe
  RECIPES = []

  attr_reader :title

  def self.create(title: nil)
    new_recipe = Recipe.new(title: title)
    RECIPES << new_recipe
  end

  def initialize(attr={})
    @title = attr[:title]
  end
end
