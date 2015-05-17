class Request < ActiveRecord::Base
  belongs_to :employee
  has_many :request_types
  validates :request_desc,  presence: true, length: { maximum: 80 }
end
