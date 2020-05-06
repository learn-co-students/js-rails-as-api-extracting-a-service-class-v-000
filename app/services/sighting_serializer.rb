class SightingSerializer
  # Important note: When I create this file, I need to restart the Rails server.
  # That will allow the SightingSerializer class to be recognized and available in the SightingsController (and other places).

  def initialize(sighting_object)
    @sighting = sighting_object
  end

  def to_serialized_json
    options = {
      include: {
        bird: {
          only: [:name, :species]
        },
        location: {
          only: [:latitude, :longitude]
        }
      },
      except: [:updated_at]
    }
    @sighting.to_json(options)
  end
end

# @sighting.to_json(
#   :include => {
#     :bird => {:only =>[:name, :species]},
#     :location => {:only =>[:latitude, :longitude]}
#   },
#   :except => [:updated_at]
# )