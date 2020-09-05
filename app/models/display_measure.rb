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
    ].reject(&:blank?).join(' ')
  end

  def quantity
    @quantity
  end

  def unit
    return if @unit.blank?

    if @quantity.to_i > 1
      @unit.name.pluralize(@quantity.to_i)
    else
      @unit.name
    end
  end

  def ingredient
    @ingredient
  end
end
