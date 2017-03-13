module ApplicationHelper
  def active_link(active_item, current_item)
    if active_item == current_item
      'active'
    end
  end

  def flash_class(level)
    case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
    end
  end

  def check_avatar(user, mode)
    if user.avatars.first.nil? && mode == 'thumb'
      return 'thumb_default_avatar.png'
    elsif user.avatars.first.nil?
      return 'default_avatar.png'
    elsif mode == 'thumb'
      return user.avatars.first.url(:thumb)
    else
      return user.avatars.first.url
    end
  end

end
