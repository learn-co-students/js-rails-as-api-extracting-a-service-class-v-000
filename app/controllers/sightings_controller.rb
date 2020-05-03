class SightingsController < ApplicationController
# Original Index Render Statement
    # def index
    #     sightings = Sighting.all
    #     render json: sightings.to_json(:include => {
    #       :bird => {:only => [:name, :species]},
    #       :location => {:only => [:latitude, :longitude]}
    #     }, :except => [:updated_at])
    #   end

# Clean up Sightings Controller index with New Service Class 
      def index
        sightings = Sighting.all
        render json: SightingSerializer.new(sightings).to_serialized_json
      end

# Original Show Render Statement
    # def show
    #     sighting = Sighting.find_by(id: params[:id])
    #     render json: sighting.to_json(:include => {
    #       :bird => {:only => [:name, :species]},
    #       :location => {:only => [:latitude, :longitude]}
    #     }, :except => [:updated_at])
    #   end

# Clean up Sightings Controller Show with New Service Class 
      def show
        sighting = Sighting.find_by(id: params[:id])
        render json: SightingSerializer.new(sighting).to_serialized_json
      end
end
