class UsersController < ApplicationController
  before_filter :authorize, except: [:new, :create]
  before_filter :user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    redirect_to new_user_path and return unless @user.save

    UserMailer.welcome_email(@user).deliver
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def autocomplete
    render :json => User.search(params[:name])
  end

  def show
    @goals = @user.goals
  end

  def edit
  end

  def update
    render(:edit) && return unless @user.update_attributes(params[:user])
    redirect_to user_path(@user)
  end

  def destroy
    session.clear
    @user.destroy
    redirect_to login_path
  end

  # def search
  #   @users = User.search(params[:friend])
  #   render '/shared/friend_results'
  # end

  private

  def user
    @user = User.find(params[:id])
  end

end
