class Employee < ActiveRecord::Base
    
    validates :firstname,  presence: true, length: { maximum: 80 }
    validates :lastname,  presence: true, length: { maximum: 80 }
    has_many :requests, dependent: :destroy

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, 
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }  
                    
# it seems to work without this, need to find out about this    
#    def admin?
#        admin
#    end
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
    
#   def self.search(query)
#   # where(:title, query) -> This would return an exact match of the query
#       where("lastname like ?", "%#{query}%") 
#   end
 
    def self.search(search)
      if search
        find(:all, :conditions => ['lastname LIKE ?', "%#{search}%"].order("lastname ASC"))
      else
        find(:all.order("lastname ASC"))
      end
    end
     #if params[:search]
    #  @employees = Employee.search(params[:search]).order("lastname ASC")
    #else
    #  @employees = Employee.all.order("lastname ASC")
    #end
end
