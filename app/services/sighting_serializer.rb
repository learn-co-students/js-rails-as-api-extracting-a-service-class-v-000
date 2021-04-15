class SightingSerializer
  def initialize(sighting_object)
    @sighting = sighting_object
  end

  def to_serialized_json
    data = {
      :include => {
        :bird => {:only => [:name, :species]},
        :location => {:only => [:latitude, :longitude]}
      },
      :except => [:updated_at]
    }
    
    @sighting.to_json(data)
  end
end