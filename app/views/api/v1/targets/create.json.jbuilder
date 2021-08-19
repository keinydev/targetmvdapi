json.target do
	json.id          @data[:target][:id]
	json.title       @data[:target][:title]
	json.radius      @data[:target][:radius]
	json.latitude    @data[:target][:latitude]
	json.longitude   @data[:target][:longitude]
	json.topic_id    @data[:target][:topic_id]
end

json.match_conversation do
  json.array! @data[:match_conversation] do |conversation|
    json.id        conversation[:id]
  end
end

json.matched_user do  
  json.array! @data[:matched_user] do |user|
		json.id         user[:id]
		json.email      user[:email]
		json.gender     user[:gender]
  end
end
