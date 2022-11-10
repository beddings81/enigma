class Enigma

  # def encrypt(message, key, date)  
  #   split = spliter(message)
  #   offset = offseter(date)
  #   # require 'pry'; binding.pry
  # end

  def character_set
    set = ("a".."z").to_a
    set.push(" ")
  end

  def spliter(string)
    string.split("")
  end

  def offseter(date)
    x = date.to_i
    y = x * x
    z = y.to_s[-4..-1].to_i
    z
  end

  def shift(keys, offsets)
    shift_hash = {:A => 0, :B => 0, :C => 0, :D => 0}
    require 'pry'; binding.pry
  end


end
