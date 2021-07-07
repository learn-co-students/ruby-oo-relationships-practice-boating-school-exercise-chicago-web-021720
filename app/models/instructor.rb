class Instructor
    attr_reader :name

    def initialize(name)
        @name = name
    end

    def self.all
        BoatingTest.all.collect {|btest| btest.instructor}.uniq
    end

    def pass_student(student, test_name)
        if test_exists?(student, test_name)
            test_exists?(student, test_name).status = "passed"
        else
            student.add_boating_test(test_name, self).status = "passed"
        end
    end

    def fail_student(student, test_name)
        if test_exists?(student, test_name)
            test_exists?(student, test_name).status = "failed"
        else
            student.add_boating_test(test_name, self).status = "failed"
        end
    end

    private

    def test_exists?(student, test_name)
        BoatingTest.all.find {|btest| btest.student == student && btest.name == test_name}
    end
end
