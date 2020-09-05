require 'rails_helper'

RSpec.describe DisplayMeasure do
  it 'should display measure with no quantity, no unit, and ingredient' do
    measure = DisplayMeasure.new(nil, nil, 'sea salt')

    expect(measure.to_s).to eql('sea salt')
  end

  it 'should display measure with no quantity, no unit, and ingredient' do
    measure = DisplayMeasure.new('', '', 'sea salt')

    expect(measure.to_s).to eql('sea salt')
  end

  it 'should display measure with quantity, no unit, and ingredient' do
    measure = DisplayMeasure.new(1, '', 'avocado')

    expect(measure.to_s).to eql('1 avocado')
  end

  it 'should display measure with quantity, unit, and ingredient' do
    unit = Unit.new(name: 'cup')
    measure = DisplayMeasure.new(1, unit, 'coconut milk')

    expect(measure.to_s).to eql('1 cup coconut milk')
  end

  it 'should display measure with quantity, pluralized unit, and ingredient' do
    unit = Unit.new(name: 'cup')
    measure = DisplayMeasure.new(2, unit, 'coconut milk')

    expect(measure.to_s).to eql('2 cups coconut milk')
  end

  it 'should display measure with quantity, unit, and ingredient' do
    unit = Unit.new(name: 'tablespoon')
    measure = DisplayMeasure.new(1, unit, 'raw cacao powder')

    expect(measure.to_s).to eql('1 tablespoon raw cacao powder')
  end

  it 'should display measure with quantity, pluralized unit, and ingredient' do
    unit = Unit.new(name: 'tablespoon')
    measure = DisplayMeasure.new(2, unit, 'raw cacao powder')

    expect(measure.to_s).to eql('2 tablespoons raw cacao powder')
  end
end
