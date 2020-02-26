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

    def pass_student(student, test_name)
        rez = BoatingTest.all.find { |bt| bt.student == student && bt.test_name == test_name }
        if rez
            rez.test_status = "passed"
        else
            BoatingTest.new(student, self, test_name, "passed")
        end
    end

    def fail_student(student, test_name)
        rez = BoatingTest.all.find { |bt| bt.student == student && bt.test_name == test_name }
        if rez
            rez.test_status = "failed"
        else
            BoatingTest.new(student, self, test_name, "failed")
        end
    end

end
