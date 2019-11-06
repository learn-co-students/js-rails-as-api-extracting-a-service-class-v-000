class Location < ApplicationRecord
    has_many :sights
    has_many :birds, through: :sightings
end
