class Student
    attr_accessor
    attr_reader :first_name

    @@all = []

    def self.all
        @@all
    end

    def self.find_student(first_name)
        @@all.find { |st| st.first_name == first_name }
    end

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, instructor, test_name, test_status)
    end

    def find_tests
        BoatingTest.all.find_all { |bt| bt.student == self }
    end

    def grade_percentage
        100.0 * self.find_tests.count { |bt| bt.test_status == "passed" } / self.find_tests.length
    end

end