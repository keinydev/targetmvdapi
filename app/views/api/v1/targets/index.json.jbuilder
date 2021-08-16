json.targets do
  json.array! @targets do |target|
    json.id          target.id
    json.radius      target.radius
    json.latitude    target.latitude
    json.longitude   target.longitude
    json.topic_id    target.topic_id
  end
end
