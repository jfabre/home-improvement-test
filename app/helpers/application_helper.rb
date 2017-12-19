module ApplicationHelper
  
  def bootstrap_alert_class_for(flash_type)    
    case flash_type.to_sym
      when :success
        "alert-success"
      when :error
        "alert-danger"
      when :notice
        "alert-info"
      else
        "alert-info"
    end
  end

  def nav_item_state_for(resource)
    controller_name == resource ? "active" : ""
  end  
end
