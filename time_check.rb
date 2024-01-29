#! /usr/bin/ruby 

#TODO - Use option parser to add offices
#TODO - Create HTML template file
#TODO - Create routine to load Office objects into HTML template
#TODO - Add weather feature
#TODO - Add local news feature

require 'optparse'
Dir["./lib/*.rb"].each {|file| require file}

def load_data
  info = TC_DATA.new
  offices = info.data_check
  return offices
end

options = {}

OptionParser.new do |opts|
  opts.banner = "Useage: time_check.rb [options]"
  

  opts.on("-h", "--help", "Display this help") do |h|
    puts opts
    exit
  end
  
  opts.on("-d", "--display", "Displays current time for all stored location.") do |d|
    offices = load_data
    offices.each {|object| puts object.inspect } 
  end

  opts.on("-n", "--new", "Add a location to the database.") do |n|
    offices = load_data
    info = gather_info()
    puts info.to_s
  end

  
end.parse!

#puts "Creating Cleveland Office."
#offices.push(Office.new(true, {name: 'CLE8', brand: 'Eighth Day Sound', city: 'Highland Heights', state: 'OH', country: 'US', postal_code: '44143'})) #, timezone: 'EST5EDT'

#puts "Creating Los Angeles Office."
#offices.push(Office.new(true, {name: 'LAX', brand: 'Eighth Day Sound / Clair Global', city: 'Los Angeles', state: 'CA', country: 'US', postal_code: '91352', timezone: 'PST8PDT'}))

#info.save(offices.last)


#puts "Office Count: #{offices.count}"

