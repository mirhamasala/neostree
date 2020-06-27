class Recipe
  attr_reader :title
  attr_writer :title

  RECIPES = []

  def initialize(title)
    @title = title
  end

  def self.all
    RECIPES
  end

  def self.create(title)
    recipe = Recipe.new(title)
    RECIPES << recipe
    recipe
  end

  def self.find_by(title)
    RECIPES.find do |recipe|
      recipe.title == title
    end
  end

  def self.update(recipe, titleUpdated)
    recipe.title = titleUpdated
    recipe
  end

  def self.delete(recipe)
    RECIPES.delete_if do |r|
      r == recipe
    end
  end
end
