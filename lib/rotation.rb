class Rotation
  attr_reader :letters

  attr_accessor :counter
              
  def initialize
    @letters = ("a".."z").to_a << " "
    @counter = 0
  end

  def a_shift(shifts, reverse = false)
    @counter += 1
    if reverse
      letters.rotate(-shifts[:A])
    else
      letters.rotate(shifts[:A])
    end
  end

  def b_shift(shifts, reverse = false)
    @counter += 1
    if reverse
      letters.rotate(-shifts[:B])
    else
      letters.rotate(shifts[:B])
    end
  end

  def c_shift(shifts, reverse = false)
    @counter += 1
    if reverse
      letters.rotate(-shifts[:C])
    else
      letters.rotate(shifts[:C])
    end
  end

   def d_shift(shifts, reverse = false)
    if reverse
      letters.rotate(-shifts[:D])
    else
      letters.rotate(shifts[:D])
    end
  end

  def index(char)
    letters.find_index(char)
  end


  def cipher(message, shift)
    encrypted = ""
    message.downcase.each_char do |char|
      if !@letters.include?(char)
        encrypted += char
      else
        if @counter == 0
          encrypted += a_shift(shift)[index(char)]
        elsif @counter == 1
          encrypted += b_shift(shift)[index(char)]
        elsif @counter == 2
          encrypted += c_shift(shift)[index(char)]
        elsif @counter == 3
          encrypted += d_shift(shift)[index(char)]
          @counter = 0
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

  def reverse(message, shift, reverse=true)
    decrypted = ""
    message.downcase.each_char do |char|
       if !@letters.include?(char)
        decrypted += char
      elsif @counter == 0
        decrypted += a_shift(shift, reverse)[index(char)]
      elsif @counter == 1
        decrypted += b_shift(shift, reverse)[index(char)]
      elsif @counter == 2
        decrypted += c_shift(shift, reverse)[index(char)]
      elsif @counter == 3
        decrypted += d_shift(shift, reverse)[index(char)]
        @counter = 0
      end
    end
    decrypted
  end
end
