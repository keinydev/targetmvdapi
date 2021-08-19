json.conversations do
  json.array! @conversations do |conversation|
    json.id          conversation.id
    json.user do
      if current_user.id == conversation.user_a_id
        json.id        conversation.user_b_id
        json.email     conversation.user_b.email
        json.gender    conversation.user_b.gender
      else
        json.id        conversation.user_a_id
        json.email     conversation.user_a.email
        json.gender    conversation.user_a.gender
      end
    end
  end
end
