puts "🦸‍♀️ Seeding powers..."
Power.create([
  { name: "super strength", description: "gives the wielder super-human strengths" },
  { name: "flight", description: "gives the wielder the ability to fly through the skies at supersonic speed" },
  { name: "super human senses", description: "allows the wielder to use her senses at a super-human level" },
  { name: "elasticity", description: "can stretch the human body to extreme lengths" }
])

puts "🦸‍♀️ Seeding heroes..."
Hero.create([
  { name: "Kamala Khan" },
  { name: "Doreen Green"},
  { name: "Gwen Stacy" },
])

puts "🦸‍♀️ Adding powers to heroes..."

strengths = ["Strong", "Weak", "Average"]
Hero.all.each do |hero|
  rand(1..3).times do
    # get a random power
    power = Power.find(Power.pluck(:id).sample)

    HeroPower.create!(hero_id: hero.id, power_id: power.id, strength: strengths.sample)
  end
end

puts "🦸‍♀️ Done seeding!"
