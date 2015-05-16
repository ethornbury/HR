class Employee < ActiveRecord::Base
  
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Employee.create! row.to_hash
        end
    end
    
    def self.to_csv
        CSV.generate do |csv|
            csv << column_names
            all.each do |employee|
                csv << employee.attributes.values_at(*column_names)
            end
        end
    end       
end
