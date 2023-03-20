class HeroPowerSerializer < ActiveModel::Serializer
  attributes :id, :strength
  belongs_to :hero
  belongs_to :power


end