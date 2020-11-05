require 'csv'
require './crud_function'

class Employee
  def show_menu
    puts "Welcome to Company Directory Management System: "
    puts "1 - Add new employee"
    puts "2 - Read existing employee"
    puts "3 - Update existing employee"
    puts "4 - Delete existing employee"

    input = gets.chomp

    case input
      when '1'
        add
      when '2'
        read
      when '3'
        update
      when '4'
        delete
    end
  end

  # done
  def add
    crud_function = CrudFunction.new

		puts "Type in your name here:"
    name = gets.chomp
    puts "Type in your age here:"
    age = gets.chomp
		puts "Type in your department here:"
		dept = gets.chomp

    emp = [name, age, dept]
		crud_function.save_to_csv(emp)
		puts "Employee record has been added. #{name} from department."
  end

  # done
  def read
    crud_function = CrudFunction.new

    crud_function.read_from_csv
  end

  def update
    crud_function = CrudFunction.new

    puts "Enter employee to update: "
    employee = gets.chomp
    puts "Update new name:"
    name = gets.chomp
    puts "Update age:"
    age = gets.chomp
		puts "Update department:"
    dept = gets.chomp
    emp = [name, age, dept]
    
    crud_function.update_csv(employee, emp)
  end

  def delete
    crud_function = CrudFunction.new

    puts "Type the employee you want to delete:"
    name = gets.chomp

    crud_function.destroy(name)
		puts "Employee #{name} have been deleted."
  end
end

start = Employee.new
start.show_menu