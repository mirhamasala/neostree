[
  RecipeCollection,
  Collection,
  Recipe,
  User,
].each do |model_class|
  model_class.destroy_all
end

%w[mirha fede pepe].each do |name|
  puts "* Creating #{name.capitalize}".green
  User.create!(
    name: name.capitalize,
    username: name,
    email: "#{name}@example.com",
    password: "u"*8,
  )
end
USERS = User.all

USERS.each do |user|
  puts " * Creating #{user.name}'s published recipes".blue
  5.times do |i|
    Recipe.create!(
      title: "#{user.name}'s published recipe #{i}",
      user: user,
      status: :published,
    )
  end

  puts " * Creating #{user.name}'s draft recipes".blueish
  5.times do |i|
    Recipe.create!(
      title: "#{user.name}'s draft recipe #{i}",
      user: user,
      status: :draft,
    )
  end
end
RECIPES             = Recipe.all
PUBLISHED_RECIPES   = RECIPES.status_published

USERS.each do |user|
  users_draft_recipes =  user.recipes.status_draft

  puts " * Creating #{user.name}'s public collection".yellow
  collection_recipes = PUBLISHED_RECIPES.shuffle.take(7) +
                       users_draft_recipes.shuffle.take(2)

  Collection.create!(
    title: "#{user.name}'s public collection",
    user: user,
    recipes: collection_recipes,
    status: :public
  )

  puts " * Creating #{user.name}'s private collection".yellow
  collection_recipes = PUBLISHED_RECIPES.shuffle.take(7) +
                       users_draft_recipes.shuffle.take(2)

  Collection.create!(
    title: "#{user.name}'s private collection",
    user: user,
    recipes: collection_recipes,
    status: :private
  )

end
