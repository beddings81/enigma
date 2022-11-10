class Enigma

  # def encrypt(message, key, date)
  #   if key.nil?
  #     #do method
  #   elsif date.nil?
  #     date = DateTime.now(strftime("%d%m%y"))
  #   else 
  #     messgae.
  #   end
  # end

  def character_set
    set = ("a".."z").to_a
    set.push(" ")
  end

  def split(string)
    string.split("")
  end

end
