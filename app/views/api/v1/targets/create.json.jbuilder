json.target do
	json.id          @data[:target][:id]
	json.title       @data[:target][:title]
	json.radius      @data[:target][:radius]
	json.latitude    @data[:target][:latitude]
	json.longitude   @data[:target][:longitude]
	json.topic_id    @data[:target][:topic_id]
end

json.match_conversation do
	json.id          @data[:match_conversation][:id]
end

json.matched_user do  
	json.id          @data[:matched_user][:id]
	json.email       @data[:matched_user][:email]	
	json.gender      @data[:matched_user][:gender]	
end