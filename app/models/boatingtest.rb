class BoatingTest
    attr_accessor :test_status
    attr_reader :student, :instructor, :test_name

    @@all = []

    def self.all
        @@all
    end

    def initialize(student, instructor, test_name, test_status = nil)
        @student = student
        @instructor = instructor
        @test_name = test_name
        @test_status = test_status
        @@all << self
    end

end