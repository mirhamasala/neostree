module RecipeHelper
  def human_attribute_yield_types
    Hash[Recipe.yield_types.map { |k, _| [k, Recipe.human_attribute_name("yield_type.#{k}")] }]
  end

  def human_attribute_status
    Hash[Recipe.statuses.map { |k, _| [k, Recipe.human_attribute_name("status.#{k}")] }]
  end
end
