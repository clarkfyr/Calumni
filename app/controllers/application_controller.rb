class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include AuthHelper
  # before_action :oldOrnew, only: [:signup]
  # before_action :signed_in, :except => [:google_callback,:home,:signup]
  before_action :signed_in, only: [:create_account]

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def signed_in
    # p "filter is called every controller",myEmail
    p "myEmail ",myEmail
    if (not myEmail) || myEmail==""
      # if direct access this url, goto root_path after login
      if request.referer.nil?
        request.env['HTTP_REFERER']=root_path
      end
      # hardcode this
      if not request.referer.include? "create"
        session[:HTTP_REFERER]=request.referer
      end
      session[:auth_redirect] = request.path
      # p request.path,"is "
      # session[:return_to] ||= request.referer
      # request.env["HTTP_REFERER"]=request.path
      p "start to redirect to google_oauth2"
      redirect_to '/auth/google_oauth2'
    end
  end



  # def oldOrnew
  #   ok=People.find_by(email: cookies[:email])
  #   # p ok,"this is in oldOrnew"
  #   if ok!=nil
  #     # old user, should have profile
  #     redirect_to profile_path
  #   end
  # end

  def current_user
    People.find_by(email: cookies[:email])
  end


  helper_method :signed_in, :current_user

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
