module AuthHelper
    def myEmail
        cookies[:email] ? cookies[:email] : nil
    end

end


