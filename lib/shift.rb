require 'date'

class Shift
  attr_reader :key, :numbers

  def initialize
    @key = ""
    @numbers = ["0","1","2","3","4","5","6","7","8","9"]
  end

  def set_offset(date=nil)
    if date.nil?
      (DateTime.now.strftime('%d%m%y').to_i ** 2).to_s[-4..-1]
    else 
      (date.to_i ** 2).to_s[-4..-1]
    end
  end

  def rand_key
    @numbers.sample(5).join
  end

  def set_key(key)
    {:A => key[0..1], :B => key[1..2], :C => key[2..3],:D => key[3..4]}
  end
end