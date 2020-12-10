class Employee
    attr_reader :salary 
    attr_accessor :boss
    def initialize(name, title, salary,boss = nil)
        @name = name
        @title = title  
        @salary = salary
        @boss = boss

        if boss != nil
            boss.employees << self
        end
    end

    def bonus(mult)
        self.salary * mult
    end

    # def boss=(boss)
    #     self.boss = boss 
    #     boss.employees << self
    # end
end

class Manager < Employee
    attr_accessor :employees

    def initialize(name, title, salary, boss = nil)
        super
        @employees = []
    end

    def bonus(mult)
        self.total * mult
    end

    def total
        total = 0
        @employees.each do |employee|
            if employee.kind_of?(Manager)
                total += employee.salary + employee.total
            else
                total += employee.salary
            end
        end
        total
    end

    # def subordinate(sub_subordinate)
    #     until @boss.nil?
    #         @employees << sub_subordinate
    # end

end


p ned = Manager.new('Ned', 'Founder', 1000000, nil)
p darren = Manager.new('Darren', 'TA Manager', 78000, ned)
p david = Employee.new('David', 'TA', 10000, darren)
p shawna = Employee.new('Shawna', 'TA', 12000, darren)
p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000