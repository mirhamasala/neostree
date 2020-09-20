class DisplayMeasure
  attr_reader :quantity, :ingredient

  def initialize(ingredient, quantity: nil, unit: nil, prep_method: nil)
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

  def unit
    return if @unit.blank?

    if @quantity.to_i > 1
      @unit.name.pluralize(@quantity.to_i)
    else
      @unit.name
    end
  end

  def prep_method
    "- #{@prep_method}" if @prep_method.present?
  end
end
