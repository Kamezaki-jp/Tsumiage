# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # destroyアクションの前だけゲストログインされているか確認
  before_action :check_guest, only: %i[update destroy]

  def check_guest
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの編集・削除はできません。'
    end
  end

  protected

    def after_update_path_for(resource)
      edit_user_registration_path
    end
end
