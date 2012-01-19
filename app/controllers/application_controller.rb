class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  layout :layout_sample
  skip_filter :verify_authenticity_token, :only => :mark_human


  def layout_sample
    if params[:controller]=="devise/sessions" || params[:controller]=="welcome"
     "welcome"
    else
      "general_layout"

    end
  end

  def allow_none
    redirect_to root_path, :alert => "you do not have sufficient privileges"
  end

  def allow_only_superadmin
    if !current_user.superadmin
      redirect_to root_path, :alert => "you do not have sufficient privileges"

    end
  end

  def allow_only_admin
    if !current_user.admin
      redirect_to root_path, :alert => "you do not have sufficient privileges"

    end

  end


def allow_only_facilitator
    if !current_user.facilitator
      redirect_to root_path, :alert => "you do not have sufficient privileges"

    end

end
  end


