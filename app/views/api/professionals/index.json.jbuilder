json.array! @pro_users do |pro_user|
	json.extract!(pro_user, :id, :title)
	json.name pro_user.user.name
	json.image_url pro_user.prof_pic.url(:medium)
end

