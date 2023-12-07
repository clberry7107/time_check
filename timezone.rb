#! /usr/bin/ruby 

Dir["./lib/*rb"].each {|file| require file}

zones = Zones.new(get_zones)
#puts zones.major
#zones.median.select {|zone| zone[0] == "America'"}.each {|zone| puts zone.join('-')}
selection = zones.median.select {|zone| zone[1] == "Chicago"}[0].join('/')
#puts get_datetime(selection)

offices = []
offices.push(Office.new({name: 'CLE8', brand: 'Eighth Day Sound', city: 'Highland Heights-OH-USA', timezone: 'EST5EDT'}))
offices.push(Office.new({name: 'LAX', brand: 'Eighth Day Sound / Clair Global', city: 'Los Angeles-CA-USA', timezone: 'PST8PDT'}))

offices.each {|here|
    puts "#{here.name}, #{here.brand}, #{here.city}, #{here.timezone}, Time: #{get_datetime(here.timezone).strftime("%H:%M")}" 
} 

get_weather("Cleveland, OH")