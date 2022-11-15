require './lib/enigma'
require 'date'

enigma = Enigma.new

file = File.open(ARGV[0], "r")
message = file.read
file.close

encrypted_message = if ARGV[2] && ARGV[3]
                      enigma.encrypt(message.chomp, ARGV[2], ARGV[3])
                    else
                      enigma.encrypt(message.chomp)
                    end

file = File.open(ARGV[1], "w")
file.write(encrypted_message[:encryption])
file.close

puts "Created '#{ARGV[1]}' with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
