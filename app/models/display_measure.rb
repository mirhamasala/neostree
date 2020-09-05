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

    @unit&.name&.pluralize(@quantity.ceil)
  end

  def ingredient
    @ingredient
  end
end
