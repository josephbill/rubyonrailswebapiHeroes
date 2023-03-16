class Hero < ApplicationRecord
    has_many :hero_powers
    has_many :powers, through: :hero_powers
end


# The first association has_many :hero_powers specifies that a hero can have multiple hero_powers. 
# This implies that there is a corresponding HeroPower class with a foreign key that references a hero's id.

# The second association has_many :powers, through: :hero_powers specifies that a hero can have multiple 
# powers through the hero_powers join table. This implies that there is a corresponding
#  Power class with a foreign key that references a hero_power's id.

# In summary, this code represents a many-to-many relationship between a Hero and a Power through the HeroPower join table.