json.data do 
	json.post do 
		json.id @post.id 
		json.title @post.title 
		json.description @post.description
		json.file @post.file

	end
end