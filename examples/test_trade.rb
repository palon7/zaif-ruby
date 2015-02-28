#!/usr/bin/env ruby
# coding: utf-8
require "etwings.rb"
require "./config.rb"
require "pp"
api = Etwings::API.new(:api_key => ETWINGS_KEY, :api_secret => ETWINGS_SECRET)
api.bid("btc", 30760, 0.0001)
api.ask("btc", 30320, 0.0001)

api.get_info
