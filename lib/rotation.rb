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
      if !@letters.include?(char)
        encrypted += char
      else
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
    end
    encrypted
  end

  def reverse_shift(shift)
    shift.each do |k, v|
      shift[k] = -v
    end
  end

  def undo(thing, shift)
    counter = 0
    decrypted = ""
    thing.downcase.each_char do |char|
       if !@letters.include?(char)
        decrypted += char
      else
        if counter == 0
          shifted = letters.rotate(-shift[:A])
          index_position = letters.find_index(char)
          decrypted += shifted[index_position]
          counter += 1
        elsif counter == 1
          shifted = letters.rotate(-shift[:B])
          index_position = letters.find_index(char)
          decrypted += shifted[index_position]
          counter += 1
        elsif counter == 2
          shifted = letters.rotate(-shift[:C])
          index_position = letters.find_index(char)
          decrypted += shifted[index_position]
          counter += 1
        elsif counter == 3
          shifted = letters.rotate(-shift[:D])
          index_position = letters.find_index(char)
          decrypted += shifted[index_position]
          counter = 0
        end
      end
    end
    decrypted
  end
end
