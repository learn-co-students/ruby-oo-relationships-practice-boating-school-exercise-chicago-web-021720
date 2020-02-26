class Instructor
    attr_accessor
    attr_reader :name

    @@all = []

    def self.all
        @@all
    end

    def initialize(name)
        @name = name
        @@all << self
    end

    def find_tests
        BoatingTest.all.find_all { |bt| bt.instructor == self }
    end

    def set_student_grade(student, test_name, new_status)
        rez = BoatingTest.all.find { |bt| bt.student == student && bt.instructor == self && bt.test_name == test_name }
        if rez
            rez.test_status = new_status
        else
            BoatingTest.new(student, self, test_name, new_status)
        end
    end

    def pass_student(student, test_name)
        self.set_student_grade(student, test_name, "passed")
    end

    def fail_student(student, test_name)
        self.set_student_grade(student, test_name, "failed")
    end

end
