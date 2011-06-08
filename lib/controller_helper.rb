module ControllerHelper
  
  def generic_sortable(modelname) #make sure modelname is in singular and camelized
    if admin?
      @sortables = modelname
      @sortables.each do |sortable|
        sortable.position = params[:sortable].index(sortable.id.to_s) + 1
        sortable.save(:validate => false)
      end
      render :nothing => true
    else
      render :nothing => true
    end
  end
  
  def homepage?
    request.url == root_url
  end
  
  protected
  
  def true_for_these_admins(*args)
    case current_admin.username
    when *args
      true
    else
      false
    end
  end
  
  def allow_devise_login?
    controller_path == 'devise/sessions' ? true : false
  end
  
  def allow_devise_registration?
    if Rails.env.development?
      controller_path == 'devise/registrations' ? true : false
    else
      false
    end
  end
  
  def allow_devise_password_change?
    controller_path == 'devise/passwords' ? true : false
  end
  
end