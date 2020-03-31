class UsersController < ApplicationController
  def registration
    @user = User.new
  end
  
  def registration_process
    user = User.new(user_params)
    if user.save
      user_login(user)
# 登録できない内容によって文章が変わるのにしたい
      flash[:success] = "ユーザー登録に成功しました。"
      redirect_to("/login")
    else
      flash[:danger] = "ユーザー登録に失敗しました。"
      redirect_to("/registration")
    end
  end
  
  def login
    @user = User.new
  end
  
  def login_process
    password_md5 = User.generate_password(user_params[:password])
    user = User.find_by(email: user_params[:email], password: password_md5)
    
    if user
      user_login(user)
      redirect_to("/") and return
    else
      flash[:danger] = "サインインに失敗しました"
      redirect_to("/login")
    end
  end
  
  def profiles
  
  end
  
  def setting
  end
  
  def edit
  end
  
  def followers
  end
end