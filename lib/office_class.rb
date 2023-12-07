#! /usr/bin/ruby 

class Office
  attr_reader :name, :brand, :city, :timezone, :location

  def initialize(params)
    @name = params[:name]
    @brand = params[:brand]
    @city = params[:city]
    @timezone = params[:timezone]
  end

  def set_location(city)
    
  end
end