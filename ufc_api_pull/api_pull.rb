#!/usr/bin/env ruby
#
# Followed the API reference at:
#    https://developer.sportradar.com/docs/read/combat_sports/UFC_v2

# Source API key
require './environment'

require 'uri'
require 'net/http'
require 'openssl'
# If the "gem" dependency isn't there, install with "gem install json"
require 'json'

#url = URI("https://api.sportradar.us/ufc/trial/v2/en/competitions.xml?api_key=#{ENV['api_key']}")
url = URI("https://api.sportradar.us/ufc/trial/v2/en/competitions.json?api_key=#{ENV['api_key']}")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)

response = http.request(request)
data_hash = JSON.parse(response.read_body)

#puts data_hash['competitions']

#data_hash['competitions'].each { |item|
#    #puts item
#    puts item['id'] + ' | ' + item['name']
#}

latest_event = data_hash['competitions'][-1]['name']
puts "The latest event listed on the API is: #{latest_event}"