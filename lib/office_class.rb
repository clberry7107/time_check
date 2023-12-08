#! /usr/bin/ruby 

class Office
  attr_reader :name, :brand, :city, :state, :country, :timezone, :location, :postal_code

  def initialize(params)
    @name = params[:name]
    @brand = params[:brand]
    @city = params[:city]
    @state = params[:state]
    @country = params[:country]
    @postal_code = params[:postal_code]
    @timezone = params[:timezone]
    @location = {lat: 0, lon: 0}

    set_location
    set_timezone
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
      <td>#{@location[:lat]}, #{@location[:lon]}</td>
    </tr>"
  end

  def to_hash
    {name: @name, brand: @brand, city: @city, state: @state, country: @country, postal_code: @postal_code, timezone: @timezone, location: @location}
  end

  private

  def set_location
    geoloc = Hash(get_geocode(@city, @state, @country, @postal_code))
    @location[:lat] = geoloc[:lat]
    @location[:lon] = geoloc[:lon]
  end

  def set_timezone
    @timezone = get_timezone(@location[:lat], @location[:lon])
  end

  
end #Office Class