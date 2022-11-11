class Rotation
  attr_reader :string, :letters

  def initialize(string)
    @string = string.downcase
    @letters = ("a".."z").to_a << " "
  end

  def set_str
    string.chars
  end

  def spin(letter, shift)
    letters[(letters.find_index(letter) + shift) % 27]
  end
end