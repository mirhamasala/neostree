require 'rails_helper'

RSpec.describe DisplayMeasure do
  # Ingredient, no unit, no quantity
  it 'should display sea salt - measure with ingredient, no quantity, and no unit' do
    measure = DisplayMeasure.new(nil, nil, 'sea salt')

    expect(measure.to_s).to eql('sea salt')
  end

  it 'should display sea salt - measure with ingredient, no quantity, and no unit' do
    measure = DisplayMeasure.new('', '', 'sea salt')

    expect(measure.to_s).to eql('sea salt')
  end
end
