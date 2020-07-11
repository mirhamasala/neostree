# == Schema Information
#
# Table name: ingredients
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
# == Schema Information
#
# Table name: ingredients
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'name' do
    context 'in memory' do
      describe 'name case' do
        it 'shouldn\'t change the case of the name when already lowercase' do
          ingredient = Ingredient.new(name: 'avocado')
          expect(ingredient.name).to eql('avocado')
        end

        it 'should return the name in lowercase when uppercase' do
          ingredient = Ingredient.new(name: 'AVOCADO')
          expect(ingredient.name).to eql('avocado')
        end

        it 'should return the name in lowercase when mixed-case' do
          ingredient = Ingredient.new(name: 'AvOcAdO')
          expect(ingredient.name).to eql('avocado')
        end
      end

      describe 'name singularization' do
        it 'should return the name singularized when plural' do
          ingredient = Ingredient.new(name: 'avocados')
          expect(ingredient.name).to eql('avocado')
        end

        it 'shouldn\'t change the number of the name when singular' do
          ingredient = Ingredient.new(name: 'avocado')
          expect(ingredient.name).to eql('avocado')
        end
      end

      describe 'names order' do
        it 'should return the names alphabetized' do
          ingredient = Ingredient.new(name: 'coconut')
          ingredient.save

          ingredient2 = Ingredient.new(name: 'avocado')
          ingredient2.save

          ingredient3 = Ingredient.new(name: 'walnut')
          ingredient3.save

          expect(Ingredient.all.alphabetize.first).to eql(ingredient2)
        end
      end
    end

    context 'in database' do
      describe 'name case' do
        it 'shouldn\'t change the case of the name when already lowercase' do
          ingredient = Ingredient.new(name: 'avocado')
          ingredient.save
          ingredient.reload
          expect(ingredient.name).to eql('avocado')
        end

        it 'should return the name in lowercase when uppercase' do
          ingredient = Ingredient.new(name: 'AVOCADO')
          ingredient.save
          ingredient.reload
          expect(ingredient.name).to eql('avocado')
        end

        it 'should return the name in lowercase when mixed-case' do
          ingredient = Ingredient.new(name: 'AvOcAdO')
          ingredient.save
          ingredient.reload
          expect(ingredient.name).to eql('avocado')
        end
      end

      describe 'name singularization' do
        it 'should return the name singularized when plural' do
          ingredient = Ingredient.new(name: 'avocados')
          ingredient.save
          ingredient.reload
          expect(ingredient.name).to eql('avocado')
        end

        it 'shouldn\'t change the number of the name when singular' do
          ingredient = Ingredient.new(name: 'avocado')
          ingredient.save
          ingredient.reload
          expect(ingredient.name).to eql('avocado')
        end
      end

      describe 'names order' do
        it 'should return the names alphabetized' do
          ingredient = Ingredient.new(name: 'coconut')
          ingredient.save
          ingredient.reload

          ingredient2 = Ingredient.new(name: 'avocado')
          ingredient2.save
          ingredient2.reload

          ingredient3 = Ingredient.new(name: 'walnut')
          ingredient3.save
          ingredient3.reload

          expect(Ingredient.all.alphabetize.first).to eql(ingredient2)
        end
      end
    end
  end
end
