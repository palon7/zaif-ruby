#!/usr/bin/env ruby
# coding: utf-8
require "zaif"
require "./config.rb"
require "pp"
api = Zaif::API.new(:api_key => ZAIF_KEY, :api_secret => ZAIF_SECRET)
api.bid("mona", 23, 1)

api.get_info
