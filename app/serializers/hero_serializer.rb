class HeroSerializer < ActiveModel::Serializer
  attributes :id, :name, :powers

  def powers
    object.hero_powers.map do |hp|
      {
        id: hp.id,
        strength: hp.strength,
        power: {
          id: hp.power.id,
          name: hp.power.name,
          description: hp.power.description
        }
      }
    end
  end
end