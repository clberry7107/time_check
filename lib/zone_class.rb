#! /usr/bin/ruby 

class Zones
  attr_reader :major, :median, :minor

  def initialize(api_response)
    @major = []
    @median = []
    @minor = []

    api_response.each {|zone| 
      split = zone.split("/")
      @major.push(split[0])
      @median.push([split[0], split[1]])
      @minor.push([split[0], split[1], split[2]])
    }

    @major.uniq!
    @median.uniq!
    #@minor.map!{|zone| zone unless zone[3].nil?}
    @minor.select!{|zone| !zone[2].nil? }
  end
end