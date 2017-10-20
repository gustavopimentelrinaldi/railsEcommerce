class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Pundit
  #manages Pundit Errors
rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

protected

def user_not_authorized
  flash[:alert] = "Você não está autorizado!!! :)"
  redirect_to(request.referrer || root_path)
end

end
