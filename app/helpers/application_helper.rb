module ApplicationHelper
  include Pagy::Frontend

  def avatar_url_for(user, opts = {})
    size = opts[:size || 32]

    if user.avatar.attached?
      user.avatar.variant(
        resize: "#{size}x#{size}!"
      )
    else
      hash = Digest::MD5.hexdigest(user.email.downcase)
      "https://secure.gravatar.com/avatar/#{hash}.png?s=#{size}"
    end
  end

  def gravatar_for(user, size: 80)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end

end
