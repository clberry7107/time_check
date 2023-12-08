#! /usr/bin/ruby 

#TODO - Use option parser to add offices
#TODO - Create load routine to build Office objects from database
#TODO - Create HTML template file
#TODO - Create routine to load Office objects into HTML template
#TODO - Add weather feature
#TODO - Add local news feature

Dir["./lib/*.rb"].each {|file| require file}

info = TC_DATA.new

offices = info.data_check

offices.push(Office.new({name: 'CLE8', brand: 'Eighth Day Sound', city: 'Highland Heights', state: 'OH', country: 'US', postal_code: '44143'})) #, timezone: 'EST5EDT'
offices.push(Office.new({name: 'LAX', brand: 'Eighth Day Sound / Clair Global', city: 'Los Angeles', state: 'CA', country: 'US', postal_code: '91352', timezone: 'PST8PDT'}))

offices.each {|object| puts object.inspect } 

#info.save(offices)