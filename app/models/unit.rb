class Unit

  ALL=%w[
    cup
    teaspoon
    tablespoon
    liter
    milliliter
    handful
    splash
    sprig
    dash
    bunch
    drop
    packet
    piece
    pinch
    shot
    gram
    tin
    can
    stick
    thumb
  ]

  attr_reader :name

  def initialize(name)
    @name = name.downcase.singularize
  end

  def self.all
    @all ||= ALL.map { |name| Unit.new(name) }
  end

  def to_s
    I18n.t("units.#{value}")
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
