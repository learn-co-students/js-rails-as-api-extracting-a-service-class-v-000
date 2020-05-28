class SightingsController < ApplicationController
    def index
        sightings = Sighting.all
        render json: SigtingSerializer.new(sightings).to_serialized_json
    end
    
    def show
        sighting = Sighting.find_by(id: params[:id])
        render json: SigtingSerializer.new(sightings).to_serialized_json
    end
end
