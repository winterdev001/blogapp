module ApplicationHelper
    def admin_authorize
        unless current_admin and current_admin.admin == true
            redirect_to root_path, alert:"Only administrator can access this page."
        end
    end
end
