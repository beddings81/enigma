require './lib/shift'
require_relative '../lib/rotation'

class Enigma < Rotation

  def encrypt(message, key=rand_key, date=today)
    the_keys = set_key(key)
    the_offsets = set_offset(date)
    the_shifts = find_shift(the_keys, the_offsets)
    {
      encryption: cipher(message, the_shifts),
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date=today)
    the_keys = set_key(key)
    the_offsets = set_offset(date)
    the_shifts = find_shift(the_keys, the_offsets)
    {
      decryption: reverse(message, the_shifts),
      key: key,
      date: date
    }
  end

end
