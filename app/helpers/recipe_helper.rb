module RecipeHelper
  def human_attribute_yield_types
    Hash[Recipe.yield_types.map { |k,v| [k, Recipe.human_attribute_name("yield_type.#{k}")] }]
  end
end
