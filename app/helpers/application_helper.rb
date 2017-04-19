module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end

  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest('alexandrianovmail@gmail.com')
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, class: "gravatar")
  end
end
