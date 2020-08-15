require 'yaml'

seed_file = Rails.root.join('config', 'locales', 'ingredients.en.yml')

config = YAML.load_file(seed_file)

config['en']['ingredients'].each_value do |ingredient|
  Ingredient.where(name: ingredient).first_or_create
end
