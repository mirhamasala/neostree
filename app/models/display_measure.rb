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
    @quantity
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
