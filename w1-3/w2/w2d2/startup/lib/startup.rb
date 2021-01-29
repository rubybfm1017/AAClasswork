require "employee"

class Startup

  attr_reader :name, :funding, :salaries, :employees
  def initialize(name, funding, salaries)

    @name = name
    @funding = funding
    @salaries= salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.key?(title)
  end

  def >(startup)

    @funding > startup.funding
  end

  def hire(employee_name, title)

    if !self.valid_title?(title)
      raise "title does not exist" 
    else
      @employees << Employee.new(employee_name, title)
    end
  end

  def size 
    @employees.length
  end  

  def pay_employee(employee)
    pay = salaries[employee.title]
    if @funding < pay
        raise "not enough funding to pay employees"
    else  
        employee.pay(pay)
        @funding -= pay
    end
  end

  def payday
    @employees.map! {|e| pay_employee(e)}
  end

  def average_salary

    @employees.inject(0) { |acc, e| acc + @salaries[e.title]} / @employees.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(startup)

    @funding += startup.funding

    startup.salaries.each do |title, pay|
      if !@salaries.key?(title)
        @salaries[title] = pay
      end
    end

    @employees += startup.employees
    startup.close
  end


end
