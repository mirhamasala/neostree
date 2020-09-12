namespace :units do
  task :populate => :environment do

    recipe = Recipe.find_or_create_by(title: "DELETE ME")

    Measure::UNITS.each do |unit_name|
      unit = Unit.find_or_create_by(name: unit_name)
      Measure.find_or_create_by(unit_id: unit.id,
                                recipe: recipe, ingredient: "ingredient")

      puts "Creating #{unit_name.blue}"
    end

    Measure.find_or_create_by(unit: nil, recipe: recipe, ingredient: "ingredient")

  end

  task :migrate => :environment do
    Measure.all.each do |measure|
      print '.'.green
      next if measure.unit_id.blank?

      unit_name = Unit.find(measure.unit_id).name
      measure.update(unit: unit_name)
    end
    puts "\nDone!".blue
  end
end
