class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

   def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "登録できたよう💫💫"
      # 保存の成功をここで扱う。
      redirect_to @user
    else
      render 'new'
    end
  end

   def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
