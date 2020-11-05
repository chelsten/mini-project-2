require 'csv'

class CrudFunction
  def save_to_csv(emp)
    CSV.open('logs2.csv', 'a+', { headers: true } ) do |csv|
      csv << emp
    end
  end

  def read_from_csv
    table = CSV.parse(File.read('logs2.csv'), { headers: true })

    table.each do |name, age, department|
      puts "Name: #{name[1]}, Age: #{age[1]}, Department: #{department[1]}"
    end
  end

  def update_csv(employee, emp)
    table = CSV.table('logs2.csv', { headers: true })

    table.delete_if do |row|
      row[:name] == employee
    end

    File.open('logs2.csv', 'w') do |f|
      f.write(table.to_csv)
    end

    CSV.open('logs2.csv', 'a+', { headers: true }) do |csv|
      csv << emp
    end
  end

  def destroy(name)
    table = CSV.table('logs2.csv', { headers: true })

    table.delete_if do |row|
      row[:name] == name
    end

    File.open('logs2.csv', 'w') do |f|
      f.write(table.to_csv)
    end
  end
end