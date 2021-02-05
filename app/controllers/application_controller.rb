class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!, :test

  def login!
    session[:user_id] = @user.id
  end
  
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorized_user?
    @user == current_user
  end

  def logout!
    session.clear
  end

  def org_routes
    @org_param_routes = []

    Organization.all.each do |org|
      @org_param_routes << [org.organization_name.parameterize, org.id]
    end

    if @org_param_routes
      render json: {
        organizations_routes: @org_param_routes
      }
    end
  end

end
