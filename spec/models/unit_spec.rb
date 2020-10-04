# == Schema Information
#
# Table name: units
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Unit, type: :model do
  describe 'name' do
    describe 'name case' do
      it 'shouldn\'t change the case of the name when already lowercase' do
        unit = Unit.new('splash')
        expect(unit.name).to eql('splash')
      end

      it 'should return the name in lowercase when uppercase' do
        unit = Unit.new('SPLASH')
        expect(unit.name).to eql('splash')
      end

      it 'should return the name in lowercase when mixed-case' do
        unit = Unit.new('SpLaSh')
        expect(unit.name).to eql('splash')
      end
    end

    describe 'name singularization' do
      it 'should return the name singularized when plural' do
        unit = Unit.new('splashes')
        expect(unit.name).to eql('splash')
      end

      it 'shouldn\'t change the number of the name when singular' do
        unit = Unit.new('splash')
        expect(unit.name).to eql('splash')
      end
    end
  end
end
