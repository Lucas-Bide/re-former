class UsersController < ApplicationController
  include UsersHelper

  def new
    @user = User.new
  end

  def create
    #@user = User.new(params.require(:user).permit(:username, :password, :email))
    @user = User.new(user_params)
    
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params);
    # puts 'putting user below'
    # puts "un: #{@user.username}; ps: #{@user.password}; em: #{@user.email}"
    if @user.save
    #   puts "errors"
    #   @user.errors { |e| puts e.to_s}
      redirect_to new_user_path
    else
      puts 'the render edit kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk'
      render :edit
    end
  end
end
