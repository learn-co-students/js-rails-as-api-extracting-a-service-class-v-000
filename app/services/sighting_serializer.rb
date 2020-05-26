class SightingSerializer

  def initialiaze(sighting)
    @sighting = sighting
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
      except: [:updated_at],
    }
    @sighting.to_json(options)
  end
end
