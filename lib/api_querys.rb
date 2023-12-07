#! /usr/bin/ruby 

require 'open-uri'
require 'json'

def get_zones()
  zones = File.new("zones", "w")
  response = URI.open("http://worldtimeapi.org/api/timezone").string
  zones << response
  zones.close()
  timezones = JSON.parse(response)

  return timezones
end

def get_datetime(zone)
  response = URI.open("http://worldtimeapi.org/api/timezone/#{zone.gsub(/[\"]/,'')}").string
  parsed = JSON.parse(response)
  dt_object = DateTime.parse(parsed["datetime"])
  return dt_object
end

def get_weather(location)
  puts location
  responce = URI.open("https://api.positionstack.com/v1/forward?access_key=#{@weather_key}&query=#{location}")
  puts responce #JSON.parse(responce)
end