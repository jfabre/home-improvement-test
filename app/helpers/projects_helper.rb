module ProjectsHelper
  
  # Assigns a bootstrap badge class to the project status
  def project_status_badge(project)
    status_class = 'success'

    status_class =
      case project.status
        when 'created' then 'primary' 
        when 'stopped' then 'danger'
        else 'success'       
      end
          
    content_tag(:span, project.status, class: ['badge', "badge-#{status_class}"])
  end
end
