require 'json'
require 'open-uri'

class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :building
  has_many :renters
end
