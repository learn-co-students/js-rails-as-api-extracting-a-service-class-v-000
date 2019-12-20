
# This can be a plain Ruby class without the need to inherit from anything:
class SightingSerializer

  # First, we will want to define an initialize method for the class.
  def initialize(sighting_object)
    @sighting = sighting_object
  end

  # Now, whatever we pass when initializing a new instance of SightingSerializer
  # will be stored as @sighting...The second step is to write a method that will
  # call to_json on this instance variable, handling the inclusion and exclusion
  # of attributes, and return the results.  Here is the method:
  def to_serialized_json
=begin
    @sighting.to_json(:include => {
      :bird => {:only => [:name, :species]},
      :location => {:only => [:latitude, :longitude]}
    }, :except => [:updated_at])
  end
=end

  # In the to_serialized_json method, we are passing multiple options into
  # to_json when it is called. These options are just key/value pairs in a hash,
  # though, and we can choose to break this line up to get a better grasp of
  # what is actually going on. Rewriting the method without changing any
  # functionality, we could write:
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
