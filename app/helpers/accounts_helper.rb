module AccountsHelper
  def user_picture(version=nil)
    if current_user.uid
      current_user.picture
    else
      current_user.picture_file_name ? current_user.picture.url(version) : "laser_cutter.svg"
    end
  end

  def user_picture_navbar(version=nil)
    if current_user.uid
      current_user.picture
    else
      current_user.picture_file_name ? current_user.picture.url(version) : "laser_cutter.svg"
    end
  end
end