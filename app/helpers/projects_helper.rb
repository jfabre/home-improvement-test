module ProjectsHelper
  
  def project_type_badge(type)
    if type == "private"
      badge_class = "danger"
    else
      badge_class = "success"
    end    

    content_tag(:span, type, class: ['badge', "badge-#{badge_class}"])  
  end  

  # Assigns a bootstrap badge class to the project status
  def project_status_badge(status)
    badge_class =
      case status
        when 'created' then 'primary' 
        when 'stopped' then 'danger'
        else 'success'       
      end
          
    content_tag(:span, status, class: ['badge', "badge-#{badge_class}"])
  end
end
