class Enigma

  def encrypt(message, key, date)  
    split = spliter(message)
    split
  end

  def character_set
    set = ("a".."z").to_a
    set.push(" ")
  end

  def spliter(string)
    string.split("")
  end

  def offset(date)
    x = date.to_i
    y = x * x
    z = y.to_s[-4..-1].to_i
    z
  end

  # def shifter(date, key)
  # end


end
