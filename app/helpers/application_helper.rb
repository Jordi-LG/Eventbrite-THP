module ApplicationHelper

  def avatar_for(user)
    @avatar = user.avatar
    if @avatar
      @avatar_user = image_tag("user.png")
    end
    return @avatar_user
  end

  def is_admin?
    if current_user.admin?
    else
      redirect_to root_path
      flash[:danger] = "Not an admin"
    end
  end


end
