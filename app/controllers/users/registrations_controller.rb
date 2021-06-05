# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # destroyアクションの前だけゲストログインされているか確認
  before_action :check_guest, only: %i[update destroy]

  def check_guest
    redirect_to root_path, alert: 'ゲストユーザーの編集・削除はできません。' if resource.email == 'guest@example.com'
  end

  protected

  def after_update_path_for(_resource)
    user_path(current_user)
  end
end
