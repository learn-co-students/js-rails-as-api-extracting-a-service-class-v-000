class SightingsController < ApplicationController
    #
    def index #We can use the same render statement in an index action without having to change it:
        sightings = Sighting.all
=begin
        render json: sightings.to_json(:include => {
          :bird => {:only => [:name, :species]},
          :location => {:only => [:latitude, :longitude]}   <-- Awful Because it's not dry
        }, :except => [:updated_at])
=end
        #end
        render json: SightingSerializer.new(sightings).to_serialized_json
    end

      #Looking back at SightingsController, we are currently calling the to_json method on the variables sightings and sighting in the two controller actions:
    def show
        sighting = Sighting.find(params[:id])
        #render json: sighting.to_json(:include => {:bird => {:only =>[:name, :species]}, :location => {:only =>[:latitude, :longitude]}}, :except => [:updated_at])
    end
end

#However, the way things are presents some problems. Having to include this in every controller action would not be very DRY. In addition, as mentioned before, it is difficult to read, and equally difficult to write and update without making errors.