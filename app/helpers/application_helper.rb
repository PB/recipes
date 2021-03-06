module ApplicationHelper
  def gravatar_for(email, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  end
end
