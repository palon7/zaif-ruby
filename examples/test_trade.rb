require "etwings.rb"
require "./config.rb"
require "pp"
api = Etwings::API.new(:api_key => ETWINGS_KEY, :api_secret => ETWINGS_SECRET)

pp api.get_info
