class Alert < ActiveRecord::Base
  belongs_to :client
  before_validation :set_client_id
  validates_presence_of :alert_type
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :client_id

  attr_accessor :email

  def set_client_id
    user = Client.find_by(email: self.email)
    puts user
    if user
      self.client_id = user.id
    end
  end
end
