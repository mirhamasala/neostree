class Unit
  ALL = %w[
    bunch
    can
    cup
    dash
    drop
    gram
    handful
    kilogram
    liter
    milliliter
    packet
    piece
    pinch
    shot
    splash
    sprig
    stick
    tablespoon
    teaspoon
    thumb
    tin
  ].freeze

  attr_reader :name

  def initialize(name)
    @name = name.downcase.singularize
  end

  def self.all
    @all ||= ALL.map { |name| Unit.new(name) }
  end

  def pluralize(count = 1)
    I18n.t("units.#{value}", count: count)
  end

  def value
    name
  end

  def ==(other)
    case other
    when Unit
      value == other.value
    when String
      value == other
    end
  end

  def <=>(other)
    name <=> other.name
  end
end
