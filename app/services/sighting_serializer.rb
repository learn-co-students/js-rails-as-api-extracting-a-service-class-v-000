class SightingSerializer #This can be a plain Ruby class without the need to inherit from anything:
 
    def initialize(sighting_object)
      @sighting = sighting_object
    end

    #The second step is to write a method that will call to_json on this instance variable, handling the inclusion and exclusion of attributes, and return the results. 
    #We will call this method to_serialized_json, and for now we can directly copy the to_json logic that currently exists in SightingsController:

    def to_serialized_json
=begin
        @sighting.to_json(:include => {
          :bird => {:only => [:name, :species]},
          :location => {:only => [:latitude, :longitude]}
        }, :except => [:updated_at])
=end
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
        #In the to_serialized_json method, we are passing multiple options into to_json when it is called. These options are just key/value pairs in a hash, though, and we can choose to break this line up to get a better grasp of what is actually going on. Rewriting the method without changing any functionality, we could write:
        #Above, we define a variable, options, assigning it to a hash. We then define two keys on that hash, :include and :except, and assign them the same values as before. Finally, at the end of the method, instead of filling to_json with a long list of options, we pass in the options hash.
      end
   
  end

  #With a fully extracted SightingSerializer, we were able to leave our controller free of clutter and extra logic. We were able to write a small class and utilize its methods multiple times, rather than repeat ourselves. Meanwhile, we now have the space within that class to make our code as easy to understand as possible.