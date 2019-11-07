module ApplicationHelper

  def avatar_for(user)
    @avatar = user.avatar
    if @avatar
      @avatar_user = image_tag("user.png")
    end
    return @avatar_user
  end

end
