class Rotation
  attr_reader :string, :letters

  def initialize(string)
    @string = string.downcase
    @letters = ("a".."z").to_a << " "
  end
end