class TC_DATA
    require 'sqlite3'
    
    def initialize
        @db = nil
    end

    def data_check
        if self.db_exist?
            puts "The data base exists!"
            @db = SQLite3::Database.open FILE_NAMES::DB
            self.retrieve_all
        else
            puts "the database does not exits.  Let's create one."
            offices = self.create_db
            if self.db_exist?
                puts "Database created."
                return offices
            else
                puts "Failed to create database."
            end
        end
    end

    def save(office)
        #@db.execute "DELETE FROM offices"
        #offices.each { |office| self.create(office) }
        self.create(office)
    end

private

    def db_exist?
        File.exist?(FILE_NAMES::DB)
    end

    def create_db
        puts "We are creating a database now, please stand by."
        @db = SQLite3::Database.open FILE_NAMES::DB
        @db.execute "CREATE TABLE IF NOT EXISTS offices(name TEXT, brand TEXT, city TEXT, state TEXT, country TEXT, postal_code TEXT, timezone TEXT, lat REAL, lon REAL)"
    end

    def create(office_object)
        puts "Saving #{office_object.name} to the database."
        @db.execute "INSERT INTO offices (
                    name, brand, city, state, country, postal_code, timezone, lat, lon
                ) 
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", office_object.name, office_object.brand, 
                    office_object.city, office_object.state, office_object.country, office_object.postal_code, office_object.timezone, office_object.lat, office_object.lon
    end

    def read(office_object)
        puts "Getting an office from the database."
    end

    def update(office_objects)

        puts "Updating office information in the database."
    end

    def delete(office_object)
        puts "Removing an office from the database."
    end

    def retrieve_all
        puts "Loading office data."
        offices = []
        @db.results_as_hash = true
        results = @db.execute "SELECT * FROM offices"

        puts "retrieved all the offices from the database."
        results.each { |data|
            offices.push(Office.create(data))
        }

        puts "Office Count: #{offices.count}"
        return offices
    end

end # class TC_DATA