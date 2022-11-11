require 'date'

class Shift
  attr_reader :key

  def initialize
    @key = ""
  end

  def set_date(date=nil)
    if date.nil?
      (DateTime.now.strftime('%d%m%y').to_i ** 2).to_s[-4..-1]
    else 
      (date.to_i ** 2).to_s[-4..-1]
    end
  end
end