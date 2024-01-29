
def gather_info()
    info = {}

    puts "\nAdd a location.\n"
    
    print "Location Name (short ie 8DS, LAX): "
    info[:name] = gets.chomp
    print "Location Brand: "
    info[:brand] = gets.chomp
    print "City: "
    info[:city] = gets.chomp
    print "State / Territory: "
    info[:state] = gets.chomp
    print "Country Abbreviation: "
    info[:country] = gets.chomp
    print "Postal Code: "
    info[:postal_code] = gets.chomp

    return info
end