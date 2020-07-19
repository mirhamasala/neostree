# == Schema Information
#
# Table name: units
#
#  id           :bigint           not null, primary key
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  fractionable :boolean
#
require 'rails_helper'

RSpec.describe Unit, type: :model do
  describe 'name' do
    context 'in memory' do
      describe 'name case' do
        it 'shouldn\'t change the case of the name when already lowercase' do
          unit = Unit.new(name: 'splash')
          expect(unit.name).to eql('splash')
        end

        it 'should return the name in lowercase when uppercase' do
          unit = Unit.new(name: 'SPLASH')
          expect(unit.name).to eql('splash')
        end

        it 'should return the name in lowercase when mixed-case' do
          unit = Unit.new(name: 'SpLaSh')
          expect(unit.name).to eql('splash')
        end
      end

      describe 'name singularization' do
        it 'should return the name singularized when plural' do
          unit = Unit.new(name: 'splashes')
          expect(unit.name).to eql('splash')
        end

        it 'shouldn\'t change the number of the name when singular' do
          unit = Unit.new(name: 'splash')
          expect(unit.name).to eql('splash')
        end
      end
    end

    context 'in database' do
      describe 'name case' do
        it 'shouldn\'t change the case of the name when already lowercase' do
          unit = Unit.new(name: 'splash')
          unit.save
          unit.reload
          expect(unit.name).to eql('splash')
        end

        it 'should return the name in lowercase when uppercase' do
          unit = Unit.new(name: 'SPLASH')
          unit.save
          unit.reload
          expect(unit.name).to eql('splash')
        end

        it 'should return the name in lowercase when mixed-case' do
          unit = Unit.new(name: 'SpLaSh')
          unit.save
          unit.reload
          expect(unit.name).to eql('splash')
        end
      end

      describe 'name singularization' do
        it 'should return the name singularized when plural' do
          unit = Unit.new(name: 'splashes')
          unit.save
          unit.reload
          expect(unit.name).to eql('splash')
        end

        it 'shouldn\'t change the number of the name when singular' do
          unit = Unit.new(name: 'splash')
          unit.save
          unit.reload
          expect(unit.name).to eql('splash')
        end
      end

      describe 'names order' do
        it 'should return the names alphabetized' do
          third_unit = Unit.new(name: 'pinch')
          third_unit.save

          second_unit = Unit.new(name: 'splash')
          second_unit.save

          first_unit = Unit.new(name: 'cup')
          first_unit.save

          units = Unit.alphabetize

          expect(units.first).to eql(first_unit)
          expect(units.second).to eql(third_unit)
          expect(units.third).to eql(second_unit)
        end
      end
    end
  end
end
