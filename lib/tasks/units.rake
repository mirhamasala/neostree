namespace :units do
  task :populate => :environment do

    recipe = Recipe.find_or_create_by(title: "DELETE ME")

    Measure::UNITS.each do |unit_name|
      unit = Unit.find_or_create_by(name: unit_name)
      Measure.find_or_create_by(unit_id: unit.id,
                              recipe: recipe, ingredient: "ingredient")

      puts "Creatinng #{unit_name.blue}"
    end
  end

  task :migrate => :environment do
    Measure.all.each do |measure|
      unit_name = Unit.find(measure.unit_id).name
      measure.update(unit: unit_name)
    end
  end
end
