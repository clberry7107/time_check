class TC_DATA
    require 'sqlite3'
    
    def initialize
        @db = nil
    end

    def db_exist?
        File.exist?(FILE_NAMES::DB)
    end

    def data_check
        if self.db_exist?
            puts "The data base exists!"
            puts "Loading office data."
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

    def save(offices)
        @db.execute "DELETE FROM offices"
        offices.each { |office| self.create(office) }
    end

private

    def create_db
        puts "We are creating a database now, please stand by."
        @db = SQLite3::Database.open FILE_NAMES::DB
        @db.execute "CREATE TABLE IF NOT EXISTS offices(name TEXT, brand TEXT, city TEXT, state TEXT, country TEXT, postal_code TEXT)"
    end

    def create(office_object)
        puts "Saving #{office_object.name} to the database."
        @db.execute "INSERT INTO offices (
                    name, brand, city, state, country, postal_code
                ) 
                VALUES (?, ?, ?, ?, ?, ?)", office_object.name, office_object.brand, 
                    office_object.city, office_object.state, office_object.country, office_object.postal_code
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
        offices = []
        puts "Getting all the offices from the database."
        @db.results_as_hash = true
        results = @db.execute "SELECT * FROM offices"
        results.each { |data|
            offices.push(Office.new(data))
        }
        return offices
    end

end # class TC_DATA