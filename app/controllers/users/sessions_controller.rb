# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # ログイン後の遷移カスタム。app/views/main/index.html.erbへのパス
  def after_sign_in_path_for(resource)
    main_index_path
  end

  # ログアウト後の遷移カスタム。app/views/home/index.html.erbへのパス
  def after_sign_out_path_for(resource_or_scope)
    home_index_path
  end
end
