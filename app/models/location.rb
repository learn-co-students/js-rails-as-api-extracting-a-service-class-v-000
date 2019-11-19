class Location < ApplicationRecord
  class Location < ApplicationRecord
    has_many :sightings
    has_many :birds, through: :sightings
  end
end
