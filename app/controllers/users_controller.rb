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
    @user = User.find(current_user.id)
    @posts = Post.where(user_id: @user.id)
    @follows = Follow.where(user_id: @user.id)
    @followers = Follower.where(user_id: @user.id)
  end
  
  def edit
    @user = User.find(current_user.id)
  end
  
  def update
    @user = User.find(current_user.id)
    
    @user.name = params[:name]
    @user.comment =params[:comment]
    upload_file = params[:user][:image]
    if upload_file.present?
      upload_file_name = upload_file.original_filename
      output_dir = Rails.root.join('public', 'users')
      output_path = output_dir + upload_file_name
      
      File.open(output_path, 'w+b') do |f|
      f.write(upload_file.read)
    end
    current_user.update(user_params.merge({image: upload_file.original_filename}))
    end
    
    if @user.update(user_params)
      flash[:success] = "プロフィールを更新しました。"
      redirect_to("/users/{:id}")
    else
      flash[:danger] = "プロフィール更新に失敗しました。"
      redirect_to("/setting_profile")
    end
  end
  
  def follow
    @user = User.find(current_user.id)
    @follows = Follow.where(user_id: @user.id)
  end
  
  def follower
    @user = User.find(current_user.id)
    @followers = Follower.where(user_id: @user.id)
  end
    
end