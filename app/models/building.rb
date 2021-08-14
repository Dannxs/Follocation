require 'json'
require 'open-uri'

class Building < ApplicationRecord
  belongs_to :user
  has_many :rentals
end
