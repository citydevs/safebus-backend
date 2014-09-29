class Bus < ActiveRecord::Base
  extend FriendlyId


  friendly_id :placa, use: :slugged
  belongs_to :route
  has_many :locations


  before_save { self.placa = placa.downcase }
end
