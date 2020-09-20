require 'rails_helper'

RSpec.describe DisplayMeasure do
  it 'displays measure given an ingredient' do
    measure = DisplayMeasure.new('sea salt')

    expect(measure.to_s).to eql('sea salt')
  end

  it 'ignores empty strings' do
    measure = DisplayMeasure.new('sea salt', quantity: '', unit: '', prep_method: '')

    expect(measure.to_s).to eql('sea salt')
  end

  it 'displays measure given an ingredient and quantity' do
    measure = DisplayMeasure.new('avocado', quantity: 1)

    expect(measure.to_s).to eql('1 avocado')
  end

  it 'displays measure given an ingredient, quantity, and unit' do
    measure = DisplayMeasure.new('coconut milk', quantity: 1, unit: Unit.new('cup'))

    expect(measure.to_s).to eql('1 cup coconut milk')
  end

  it 'displays measure given an ingredient, quantity, and singular unit' do
    measure = DisplayMeasure.new('coconut milk', quantity: 2, unit: Unit.new('cup'))

    expect(measure.to_s).to eql('2 cups coconut milk')
  end

  it 'displays measure given an ingredient, quantity, and pluralized unit' do
    measure = DisplayMeasure.new('raw cacao powder', quantity: 1, unit: Unit.new('tablespoons'))

    expect(measure.to_s).to eql('1 tablespoon raw cacao powder')
  end

  it 'displays measure given an ingredient, quantity, unit, and prep method' do
    measure = DisplayMeasure.new('almonds', quantity: 100, unit: Unit.new('gram'), prep_method: 'soaked overnight')

    expect(measure.to_s).to eql('100 grams almonds - soaked overnight')
  end
end
