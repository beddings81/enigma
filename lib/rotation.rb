require_relative '../lib/shift'
class Rotation < Shift
  attr_reader :letters

  def initialize
    @letters = ("a".."z").to_a << " "
  end

  def shift(letter, shift)
    letters[(letters.find_index(letter) + shift) % 27]
  end

  def cipher(thing, shifts)
    counter = 0
    encrypted = ""
    thing.downcase.each_char do |char|
      if counter == 0
        shifted = letters.rotate(shifts[:A])
        index_position = letters.find_index(char)
        encrypted += shifted[index_position]
        counter += 1
      elsif counter == 1
        shifted = letters.rotate(shifts[:B])
        index_position = letters.find_index(char)
        encrypted += shifted[index_position]
        counter += 1
      elsif counter == 2
        shifted = letters.rotate(shifts[:C])
        index_position = letters.find_index(char)
        encrypted += shifted[index_position]
        counter += 1
      elsif counter == 3
        shifted = letters.rotate(shifts[:D])
        index_position = letters.find_index(char)
        encrypted += shifted[index_position]
        counter = 0
      end
    end
    encrypted
  end

  def reverse_shift(shift)
    shift.each do |k, v|
      shift[k] = -v
    end
  end
end

        # shifted_alphabet = letters.rotate(find_shift[:a])
        # index_position = alphabet.find_index(letter)
        # encrypted += shifted_alphabet[index_position]
        # counter += 1
        #counter resets to go back through the string