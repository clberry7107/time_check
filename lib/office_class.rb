#! /usr/bin/ruby 

require 'json'

class Office
  attr_reader :name, :brand, :city, :state, :country, :timezone, :lat, :lon, :postal_code

  def initialize(new, params)
    @name = params[:name]
    @brand = params[:brand]
    @city = params[:city]
    @state = params[:state]
    @country = params[:country]
    @postal_code = params[:postal_code]
    @timezone = params[:timezone]
    @location = {lat: 0, lon: 0}
    @lat = 0
    @lon = 0

    if new
      set_location
      set_timezone
    end
  end

  def self.create(params)
    hparams = HASH::from_string(params)
    object = self.new(false, hparams)
    return object
  end

  def current_time
    get_datetime(@timezone).strftime("%H:%M")
  end

  def inspect
    "#{@name}\t #{@brand}\t\t #{@city}, #{@state}, #{@country}\t\t Time: #{current_time}"
  end

  def to_html
    "<tr>
      <td>#{@name}</td>
      <td>#{current_time}</td>
      <td>#{@brand}</td>
      <td>#{@city}}</td>
      <td>#{@state}</td>
      <td>#{@country}</td>
      <td>#{@postal_code}</td>
      <td>#{@lat}, #{@lon}</td>
    </tr>"
  end

  def to_hash
    {name: @name, brand: @brand, city: @city, state: @state, country: @country, postal_code: @postal_code, timezone: @timezone, lat: @lat, lon: @lon}
  end

  private

  def set_location
    geoloc = Hash(get_geocode(@city, @state, @country, @postal_code))
    @lat = geoloc[:lat]
    @lon = geoloc[:lon]
  end

  def set_timezone
    @timezone = get_timezone(@lat, @lon)
  end

  
end #Office Class