class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller? # deviseで情報登録をするとき、以下の configure_permitted_parameters が適用される
  before_action :authenticate_user!

  protected
  # Deviseコントローラ呼び出し時に許可するパラメータ
  def configure_permitted_parameters
    added_attrs = [ :email, :password, :password_confirmation, :first_name, :last_name, :first_name_kana, :last_name_kana, :gender, :birthdate ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
