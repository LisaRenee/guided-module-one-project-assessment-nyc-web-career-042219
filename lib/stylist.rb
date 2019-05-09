 #require "pry"

class Stylist < ActiveRecord::Base

  has_many :appointments
  has_many :clients, through: :appointments


end
# binding.pry
