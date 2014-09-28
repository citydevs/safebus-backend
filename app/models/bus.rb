class Bus < ActiveRecord::Base
  belongs_to :route
  has_many :locations
end
