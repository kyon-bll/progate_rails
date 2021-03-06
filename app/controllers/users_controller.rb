# coding: utf-8
class UsersController < ApplicationController
  before_action :authenticate_user, { only: [:edit, :update, :profile] }
  before_action :forbid_login_user, { only: [:new, :created, :login_form, :login] }
  
  def index
    @users = User.all.order(created_at: :desc)
  end

  def profile
    @user = User.find_by(id: session[:user_id])
    render "users/show"
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      image_name: "default_user.jpg",
      password: params[:password],
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/posts")
    else
      render("users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

    # ファイル保存
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users")
    else
      render("users/edit")
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy

    flash[:notice] = "ユーザーを削除しました"
    redirect_to("/users")
  end

  def login_form
    @email = ""
    @password = ""
  end
  
  def login
    @email = params[:email]
    @password = params[:password]
    @user = User.find_by(email: @email, password: @password)
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to "/posts"
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      render "/users/login_form"
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to "/login"
  end
  
end
