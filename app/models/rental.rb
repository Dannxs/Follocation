require 'json'
require 'open-uri'

class Rental < ApplicationRecord
  belongs_to :user
  has_many :renters
end
