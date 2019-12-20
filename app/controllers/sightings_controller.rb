class SightingsController < ApplicationController

=begin
  def index
    sightings = Sighting.all
    render json: sightings.to_json(:include => {
      :bird => {:only => [:name, :species]},
      :location => {:only => [:latitude, :longitude]}
    }, :except => [:updated_at])
  end

  def show
    sighting = Sighting.find_by(id: params[:id])
    render json: sighting.to_json(:include => {
      :bird => {:only => [:name, :species]},
      :location => {:only => [:latitude, :longitude]}
    }, :except => [:updated_at])
  end
=end

  # With this setup, once an instance of SightingSerializer is created, we can
  # call to_serialized_json on it to get our data customized and ready to go as
  # a JSON string!

  # Now it is time to clean up SightingsController and replace the original
  # render statements with our new service class:
  def index
    sightings = Sighting.all
    render json: SightingSerializer.new(sightings).to_serialized_json
  end

  def show
    sighting = Sighting.find_by(id: params[:id])
    render json: SightingSerializer.new(sighting).to_serialized_json
  end
  
end
