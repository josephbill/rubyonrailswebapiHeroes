class HeroPower < ApplicationRecord
  belongs_to :power
  belongs_to :hero
end

# The first association belongs_to :power specifies that a HeroPower instance belongs to a Power instance. 
# This implies that there is a corresponding Power class with a foreign key that references a hero_power's id.

# The second association belongs_to :hero specifies that a HeroPower instance belongs to a Hero instance.
#  This implies that there is a corresponding Hero class with a foreign key that references a hero_power's id.

# In summary, this code represents a many-to-many relationship between a Hero and a Power through the HeroPower join table.
#  The HeroPower class serves as a bridge between the Hero and Power classes, allowing us to associate multiple heroes with
#   multiple powers.