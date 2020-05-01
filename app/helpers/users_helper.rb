module UsersHelper
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
