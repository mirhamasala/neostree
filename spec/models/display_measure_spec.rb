require 'rails_helper'

RSpec.describe DisplayMeasure do
  it '1 avocado' do
    ingredient = Ingredient.new(name: 'avocado')

    measure = DisplayMeasure.new(1, nil, ingredient)

    expect(measure.to_s).to eql('1 avocado')
  end

  it '2 avocados' do
    ingredient = Ingredient.new(name: 'avocado')

    measure = DisplayMeasure.new(2, nil, ingredient)

    expect(measure.to_s).to eql('2 avocados')
  end

  it '1/2 cup avocado' do
    ingredient = Ingredient.new(name: 'avocado')
    unit = Unit.new(name: 'cup', fractionable: true)

    measure = DisplayMeasure.new(0.5, unit, ingredient)

    expect(measure.to_s).to eql('1/2 cup avocado')
  end

  it '1/2 cinnamon stick' do
    ingredient = Ingredient.new(name: 'cinnamon stick')

    measure = DisplayMeasure.new(0.5, nil, ingredient)

    expect(measure.to_s).to eql('1/2 cinnamon stick')
  end

  it '2 cups coconut' do
    ingredient = Ingredient.new(name: 'coconut')
    unit = Unit.new(name: 'cup')

    measure = DisplayMeasure.new(2, unit, ingredient)

    expect(measure.to_s).to eql('2 cups coconut')
  end

  it '200 grams coconut' do
    ingredient = Ingredient.new(name: 'coconut')
    unit = Unit.new(name: 'gram')

    measure = DisplayMeasure.new(200, unit, ingredient)

    expect(measure.to_s).to eql('200 grams coconut')
  end

  it '1/2 coconut' do
    ingredient = Ingredient.new(name: 'coconut')

    measure = DisplayMeasure.new(0.5, nil, ingredient)

    expect(measure.to_s).to eql('1/2 coconut')
  end

  it '0.5 kilo coconut' do
    ingredient = Ingredient.new(name: 'coconut')
    unit = Unit.new(name: 'kg', fractionable: false)

    measure = DisplayMeasure.new(0.5, unit, ingredient)

    expect(measure.to_s).to eql('0.5 kg coconut')
  end

  it '1/3 cup coconut oil' do
    ingredient = Ingredient.new(name: 'coconut oil')
    unit = Unit.new(name: 'cup', fractionable: true)

    measure = DisplayMeasure.new(0.6666, unit, ingredient)

    expect(measure.to_s).to eql('1/3 cup coconut oil')
  end

  xit 'sea salt' do
    ingredient = Ingredient.new(name: 'sea salt')

    measure = DisplayMeasure.new(nil, nil, ingredient)

    expect(measure.to_s).to eql('sea salt')
  end

  it '3/8 cup coconut oil' do
    skip 'manage 1/2 1/4 1/3 1 2/3 3/4 '
    ingredient = Ingredient.new(name: 'coconut oil')
    unit = Unit.new(name: 'cup')

    measure = DisplayMeasure.new('3/8', unit, ingredient)

    expect(measure.to_s).to eql('3/8 cup coconut oil')
  end
end
