module UsersHelper

	# Returns gravatar for the  given user
	def gravatar_for(user, size: 50)
		gid = Digest::MD5::hexdigest(user.email.downcase)
		gurl = "https://secure.gravatar.com/avatar#{gid}?s=#{size}"
		image_tag(gurl, alt: user.name, class: "gravatar")
	end	
end
