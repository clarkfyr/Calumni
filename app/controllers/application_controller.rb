class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include AuthHelper
  # before_action :oldOrnew, only: [:signup]
  # before_action :signed_in, :except => [:google_callback,:home,:signup]
  before_action :signed_in, only: [:create_mentor]

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  
  def signed_in
    p "filter is called every controller",myEmail
    p myEmail==""
    if (not myEmail) || myEmail==""
      session[:auth_redirect] = request.path
      p request.path,"is "
      # session[:return_to] ||= request.referer
      # request.env["HTTP_REFERER"]=request.path
      # byebug  
      p "start to redirect"
      # byebug
      redirect_to '/auth/google_oauth2'
    end
  end


  
  def oldOrnew
    ok=People.find_by(email: cookies[:email])
    p ok,"this is in oldOrnew"
    if ok!=nil
      # old user, should have profile
      redirect_to profile_path
    end
  end


  # private
  # def after_sign_out_path_for(resource_or_scope)
  #   # If it's admin 
  #    p "####in the signout"
  #   # if myEmail
  #   # ?(current_user)
  #   #     admin_path
  #   # # Otherwise
  #   # else
  #   #     root_path
  #   # end
  # end
end

