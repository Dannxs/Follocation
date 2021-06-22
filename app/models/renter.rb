require 'json'
require 'open-uri'

class Renter < ApplicationRecord
  belongs_to :user
  belongs_to :rental
end
