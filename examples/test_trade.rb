#!/usr/bin/env ruby
# coding: utf-8
require "etwings.rb"
require "./config.rb"
require "pp"
api = Etwings::API.new(:api_key => ETWINGS_KEY, :api_secret => ETWINGS_SECRET)

pp api.get_trade_history(:since => Time.parse("2015-02-01").to_i)
