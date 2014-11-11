class Bus < ActiveRecord::Base
  extend FriendlyId


  friendly_id :placa, use: :slugged
  belongs_to :route
  has_many :locations, dependent: :destroy
  has_many :most_recent_location, -> { order('created_at DESC').limit(1) }, class_name: 'Location'


  before_save { self.placa = placa.downcase }
end
