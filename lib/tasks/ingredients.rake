task :copy_ingredient_names => :environment do
  Measure.all.each do |measure|
    ingredient_name = Ingredient.find(measure.ingredient_id).name
    measure.update(ingredient: ingredient_name)
  end
end
