module RecipeHelper
  def human_attribute_yield_types
    Hash[Recipe.yield_types.map { |k, _| [k, Recipe.human_attribute_name("yield_type.#{k}")] }]
  end

  def human_attribute_status(model)
    Hash[model.statuses.map { |k, _| [k, model.human_attribute_name("status.#{k}")] }]
  end

  def all_with_images_attached?(recipes)
    recipes.all? { |recipe| recipe.photo.attached? }
    # recipes.all?(&:photo.attached?)
  end
end
