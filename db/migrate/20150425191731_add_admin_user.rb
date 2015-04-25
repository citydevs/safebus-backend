require 'active_record/fixtures'

class AddAdminUser < ActiveRecord::Migration
  def self.up
    User.create email: "admin@safebus.mx", password: "ch4ng3-m3", password_confirmation: "ch4ng3-m3"
  end

  def self.down
    User.delete_all
  end
end
