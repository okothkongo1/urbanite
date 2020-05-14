module UsersHelper
  def authenticate_admin
    return unless !admin?
    redirect_to root_path
  end

  private
  def admin?
    if current_user
    current_user.role.name == 'admin'
    else
      false
    end
  end

end
