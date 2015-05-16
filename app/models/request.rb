class Request < ActiveRecord::Base
  belongs_to :employee
  has_many :request_types
end
