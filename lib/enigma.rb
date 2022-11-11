class Enigma

  def encrypt(message, key, date)  
    spliter(message) #message is formated
    offseter(date)   #date is formated
    set_key(key)     #key is formatted
    # require 'pry'; binding.pry
  end

  def characters
    set = ("a".."z").to_a
    set.push(" ")
  end

  def spliter(string)
    string.chars
  end

  def shift(keys, offsets)
    shift_hash = {:A => 0, :B => 0, :C => 0, :D => 0}
    shift_hash[:A] += keys[0] + offsets[0]
    shift_hash[:B] += keys[1] + offsets[1]
    shift_hash[:C] += keys[2] + offsets[2]
    shift_hash[:D] += keys[3] + offsets[3]
    shift_hash
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

