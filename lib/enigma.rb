class Enigma

  def encrypt(message, key, date)
  end

  def characters
    set = ("a".."z").to_a
    set.push(" ")
  end

  def spliter(string)
    string.chars
  end

  def cypher(message,keys)
    keys = keys.values
    encrypted = ""
    ma = spliter(message)
    until encrypted.length == ma.length do
        encrypted << characters[(characters.index(ma[0]) + keys[0]) %27]
        encrypted << characters[(characters.index(ma[1]) + keys[1]) %27]
        encrypted << characters[(characters.index(ma[2]) + keys[2]) %27]
        encrypted << characters[(characters.index(ma[3]) + keys[3]) %27]
      # require 'pry'; binding.pry
    end
    encrypted
  end

end

