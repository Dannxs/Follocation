require 'json'
require 'open-uri'

class Renter < ApplicationRecord
  belongs_to :rental
end
