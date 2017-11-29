class AuthController < ApplicationController
    def google_callback
        p "start login###"
        p request.env["omniauth.auth"]
        authentication_info = request.env["omniauth.auth"]
        p authentication_info
        cookies[:email] = authentication_info['info']['email']
        cookies[:lastname]=authentication_info['info']['first_name']        
        cookies[:lastname]=authentication_info['info']['last_name']
        cookies[:name]=authentication_info['info']['name']
        p cookies[:email]
        p session[:people_id]
        p session[:auth_redirect] #requested path
        if session[:auth_redirect] != nil
          redirect_to session[:auth_redirect]
        else
          redirect_to '/'
        end
    end
    def delete(name, options = {})
      options.stringify_keys!
      set_cookie(options.merge("name" => name.to_s, "value" => "", "expires" => Time.at(0)))
    end
    def logout
        cookies.delete :email
        # cookies =nil
        # reset_session
        redirect_to home_path
        # redirect_to "https://accounts.google.com/logout"
    end
end
