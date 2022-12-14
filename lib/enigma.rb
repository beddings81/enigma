require_relative '../lib/rotation'
require_relative '../lib/shift'

class Enigma < Rotation
  include Shift

  def encrypt(message, key=rand_key, date=today)
    the_keys = set_key(key)
    the_offsets = set_offset(date)
    the_shifts = find_shift(the_keys, the_offsets)
    @counter = 0
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
    @counter = 0
    {
      decryption: reverse(message, the_shifts, reverse=true),
      key: key,
      date: date
    }
  end
end
