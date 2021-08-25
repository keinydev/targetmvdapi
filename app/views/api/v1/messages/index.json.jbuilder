json.items  @pagy.items
json.total  @pagy.count
json.pages  @pagy.pages

json.messages do
  json.array! @messages do |message|
    json.id         message.id
    json.message    message.body
    json.send_at    message.created_at.strftime("%Y-%m-%d %H:%M")
    json.user do
      json.id       message.user_id
      json.email    message.user.email
    end
  end
end
