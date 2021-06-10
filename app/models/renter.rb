require 'json'
require 'open-uri'

class Renter < ApplicationRecord
  belongs_to :user
  has_many :rentals
end
