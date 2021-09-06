require 'faker'

topic1 = Topic.create(name: "Music",  image: Faker::LoremFlickr.image(search_terms: ['music']))
topic2 = Topic.create(name: "Food",   image: Faker::LoremFlickr.image(search_terms: ['food']))
topic3 = Topic.create(name: "Travel", image: Faker::LoremFlickr.image(search_terms: ['travel']))
topic4 = Topic.create(name: "Art",    image: Faker::LoremFlickr.image(search_terms: ['art']))
topic5 = Topic.create(name: "Dating", image: Faker::LoremFlickr.image(search_terms: ['love']))

benefit1 = Benefit.create(name: "Basic Benefit",   price: 7)
benefit2 = Benefit.create(name: "Plus Benefit",    price: 15)
benefit3 = Benefit.create(name: "Premium Benefit", price: 22)
