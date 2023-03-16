class Power < ApplicationRecord
    has_many :hero_powers, dependent: :destroy
    has_many :heros, through: :hero_powers, dependent: :destroy

    validates :description, presence: true, length: {minimum: 20}
end


# The dependent option in the has_many association allows you to specify what should happen to associated records 
# when the parent record is deleted.

# In this example, the Power class has two has_many associations with the HeroPower and Hero classes, respectively. 
# Both of these associations have the dependent: :destroy option set.

# This means that when a Power instance is deleted, all associated HeroPower instances and the associated Hero instances 
# will be destroyed as well.

# For example, if you have a Power instance with id of 1 and it has two associated HeroPower instances with ids of 2 and 3,
#  and each of those HeroPower instances has a corresponding Hero instance, then deleting the Power instance with id of 1 
#  will also delete the HeroPower instances with ids of 2 and 3, as well as the corresponding Hero instances.

# The validates line specifies a validation that requires the description attribute of a Power instance to be present and 
# have a minimum length of 20 characters. This means that a Power instance cannot be saved to the database unless it meets
#  these validation requirements.