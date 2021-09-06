json.benefits do
  json.array! @benefits do |benefit|
    json.id          benefit.id
    json.name        benefit.name
    json.price       benefit.price
  end
end
