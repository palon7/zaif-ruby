require "./etwings.rb"

api = Etwings::API.new

puts "MONA/JPY: " + api.get_last_price("mona").to_s
puts "BTC/JPY : " + api.get_last_price("btc").to_s
