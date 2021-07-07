class Student
    attr_reader :first_name

    def initialize(first_name)
        @first_name = first_name
    end

    def self.all
        BoatingTest.all.collect {|btest| btest.student}.uniq
    end

    def self.find_student(name)
        BoatingTest.all.find {|btest| btest.student.first_name == name}.student
    end

    def add_boating_test(test_name, instructor)
        BoatingTest.new(self, test_name, instructor)
    end

    def tests
        BoatingTest.all.select {|btest| btest.student == self}
    end

    def grade_percentage
        grades = self.tests.collect {|test| test.status}
        number_of_passes = grades.count {|status| status == "passed"}
        (number_of_passes.to_f / self.tests.length) * 100
    end
end
