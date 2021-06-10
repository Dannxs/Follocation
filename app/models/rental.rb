require 'json'
require 'open-uri'

class Rental < ApplicationRecord
  belongs_to :renter
end
