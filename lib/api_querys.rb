#! /usr/bin/ruby 
require_relative 'config.rb'
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

def get_timezone(lat, lon)
  #puts "Geoapify key: #{API_KEYS::GEOAPIFY}"
  responce = URI.open(".v1/geocode/reverse?lat=#{lat}&lon=#{lon}&apiKey=#{API_KEYS::GEOAPIFY.gsub(/[\"]/,'')}").string
  parsed = JSON.parse(responce)
  features = parsed["features"]
  f_string = features[0].to_s
  f_hash = eval(f_string)
  return f_hash["properties"]["timezone"]["name"]
end

def get_datetime(zone)
  response = URI.open("http://worldtimeapi.org/api/timezone/#{zone.gsub(/[\"]/,'')}").string
  parsed = JSON.parse(response)
  dt_object = DateTime.parse(parsed["datetime"])
  return dt_object
end

def get_weather(location)
  puts location
  responce = URI.open("https://api.positionstack.com/v1/forward?access_key=#{API_KEYS::WEATHER}&query=#{location}")
  puts responce #JSON.parse(responce)
end

def get_geocode(city, state, country, postal_code)
  responce = URI.open("https://geocode.maps.co/search?q=#{city}+#{state}+#{country}+#{postal_code}").string
  parsed = JSON.parse(responce)
  lon =  parsed.first["lon"] 
  lat =  parsed.first["lat"] 
  return {lat: lat, lon: lon}
end