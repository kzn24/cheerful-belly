class UsersController < ApplicationController
  def edit
  end

  def update
  end

  def show
    @user = current_user
  end

  def destroy
    current_user.destroy
    redirect_to root_path, notice: "退会処理が完了しました。またのご利用をお待ちしております。"
  end
end
