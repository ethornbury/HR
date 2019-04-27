class Request < ActiveRecord::Base
  belongs_to :employee
  has_many :request_types

  validates :request_desc,  presence: true, length: { maximum: 80 }
  
  def self.search(query)
    # where(:title, query)  #This would return an exact match of the query
    where("status like ?", "%#{query}%")  #will return on partial and not case sensitive
    
    #return an exact integer match of the query
    #where("status = ?", "#{query}")
  end
  
end
