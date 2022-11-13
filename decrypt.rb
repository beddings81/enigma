require './lib/enigma'
require 'date'

enigma = Enigma.new

file = File.open(ARGV[0], "r")
message = file.read
file.close

decrypted_message = enigma.decrypt(message.chomp, ARGV[2], ARGV[3])

file = File.open(ARGV[1], "w")
file.write(decrypted_message[:decryption])
file.close

puts "Created '#{ARGV[1]}' with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"