require 'date'

class Shift
  attr_reader :key, :date, :numbers

  def initialize(input = {})
    @key = input[:key] || ""
    @date = input[:date] || Date.today.to_s
    @numbers = ["0","1","2","3","4","5","6","7","8","9"]
  end

  def set_offset(date=nil)
    if date.nil?
      (DateTime.now.strftime('%d%m%y').to_i ** 2).to_s[-4..-1]
    else 
      (date.to_i ** 2).to_s[-4..-1]
    end
  end

  def today
    Date.today.strftime("%d%m%y")
  end

  def rand_key
    (10000..99999).to_a.sample.to_s
  end

  def set_key(key)
    {:A => key[0..1], :B => key[1..2], :C => key[2..3],:D => key[3..4]}
  end

  def find_shift(key, offsets)
    {:A => key[:A].to_i + offsets[0].to_i,
     :B => key[:B].to_i + offsets[1].to_i,
     :C => key[:C].to_i + offsets[2].to_i,
     :D => key[:D].to_i + offsets[3].to_i}
  end
end