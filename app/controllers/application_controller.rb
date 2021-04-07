class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    # 新規登録時にnameのストロングパラメータを追加する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # アカウントの編集時にnameとintroductionのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction, :profile_image])
  end
end
