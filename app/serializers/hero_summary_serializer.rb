class HeroSummarySerializer < ActiveModel::Serializer
    attributes :summary, :power
  
    def summary
      "#{self.object.name} - #{self.object.created_at}..."
    end

    # how can i log out the details of this power (name and description , strength)
    # power model which may have its specifications 
    # associations and association 
    def power
        "#{self.object.powers}"
    end
  
  end