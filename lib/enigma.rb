require './lib/shift'
require './lib/rotation'

class Enigma

  def encrypt(message, key, date)
    shift = Shift.new({:key => key, :date => date})
    # require 'pry'; binding.pry
    new_message = Rotation.new(message).cipher(shift.find_shift)
    "{encryption: => #{new_message},
      key:        => #{key},
      date:       => #{date}
    }"
  end

  def decrypt(message, key, date)
    
  end

end
