class Members::SessionsController < Devise::SessionsController

    protected

    def after_sign_in_path_for(resource)
        profile_dashboard_path
    end
end