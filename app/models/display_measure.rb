class DisplayMeasure
  def initialize(quantity, unit, ingredient)
    @quantity = quantity
    @unit = unit
    @ingredient = ingredient
  end

  def to_s
    [
      quantity,
      unit,
      ingredient
    ].join(' ')
  end

  def quantity
    if @unit.name == 'cup' || @unit.name == 'teaspoon' || @unit.name == 'tablespoon'
      if @quantity < 1
        @quantity.to_s.to_r
      elsif (@quantity % 1).zero?
        @quantity.to_i
      else
        "#{@quantity.to_i} #{@quantity.to_s.to_r - @quantity.to_i}"
      end
    else
      @quantity.to_i
    end
  end

  def unit
    @unit.name.pluralize(@quantity.ceil) if @unit
  end

  def ingredient
    if @unit
      @ingredient.name
    else
      @ingredient.name.pluralize(@quantity.ceil)
    end
  end
end
