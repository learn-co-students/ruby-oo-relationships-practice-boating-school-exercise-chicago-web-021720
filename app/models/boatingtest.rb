class BoatingTest
    attr_accessor :status
    attr_reader :student, :name, :instructor
    @@all = []
    
    def initialize(student, name, instructor)
        @student = student
        @name = name
        @instructor = instructor
        @status = "new"
        @@all << self
    end

    def self.all
        @@all
    end
end
