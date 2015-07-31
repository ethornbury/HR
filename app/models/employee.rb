class Employee < ActiveRecord::Base
    
    validates :firstname,  presence: true, length: { maximum: 80 }
    validates :lastname,  presence: true, length: { maximum: 80 }
    has_many :requests, dependent: :destroy

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, 
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }  
    
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
    
    def self.search(query)
    # where(:title, query) -> This would return an exact match of the query, below is for similar
       where("lastname like ?", "%#{query}%") 
    end
    
end