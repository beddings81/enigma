class Enigma

  def encrypt(message, key, date)  
    spliter(message)
    offseter(date)
    set_key(key)
    # require 'pry'; binding.pry
  end

  def character_set
    set = ("a".."z").to_a
    set.push(" ")
  end

  def spliter(string)
    string.split("")
  end

  def offseter(date)
    date_num = date.to_i
    date_squared = date_num * date_num
    last_4 = date_squared.to_s[-4..-1]
    offset_strings = last_4.split("")
     offsets = offset_strings.map do |num|
      num.to_i
    end
    offsets
  end

  def set_key(key)
    key_array = []
    x = key.split("")
    a = x[0..1].join.to_i
    b = x[1..2].join.to_i
    c = x[2..3].join.to_i
    d = x[3..4].join.to_i
    key_array << a
    key_array << b
    key_array << c
    key_array << d
    key_array
    # require 'pry'; binding.pry
  end

  def key_hash
    key_hash = {:A => a, :B => b, :C => c, :D => d}
  end

  def shift(keys, offsets)
    shift_hash = {:A => 0, :B => 0, :C => 0, :D => 0}
    shift_hash[:A] += keys[0] + offsets[0]
    shift_hash[:B] += keys[1] + offsets[1]
    shift_hash[:C] += keys[2] + offsets[2]
    shift_hash[:D] += keys[3] + offsets[3]
    shift_hash
  end
end
