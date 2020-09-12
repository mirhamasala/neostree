class DisplayMeasure
  def initialize(quantity, unit, ingredient, prep_method)
    @quantity = quantity
    @unit = unit
    @ingredient = ingredient
    @prep_method = prep_method
  end

  def to_s
    [
      quantity,
      unit,
      ingredient,
      prep_method
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

  def prep_method
    "- #{@prep_method}" if @prep_method.present?
  end
end
