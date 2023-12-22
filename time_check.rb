#! /usr/bin/ruby 

#TODO - Use option parser to add offices
#TODO - Create HTML template file
#TODO - Create routine to load Office objects into HTML template
#TODO - Add weather feature
#TODO - Add local news feature

Dir["./lib/*.rb"].each {|file| require file}

info = TC_DATA.new

offices = info.data_check

#puts "Creating Cleveland Office."
#offices.push(Office.new(true, {name: 'CLE8', brand: 'Eighth Day Sound', city: 'Highland Heights', state: 'OH', country: 'US', postal_code: '44143'})) #, timezone: 'EST5EDT'

#puts "Creating Los Angeles Office."
#offices.push(Office.new(true, {name: 'LAX', brand: 'Eighth Day Sound / Clair Global', city: 'Los Angeles', state: 'CA', country: 'US', postal_code: '91352', timezone: 'PST8PDT'}))

#info.save(offices.last)


#puts "Office Count: #{offices.count}"
offices.each {|object| puts object.inspect } 

