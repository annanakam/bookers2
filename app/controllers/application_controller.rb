class ApplicationController < ActionController::Base
  # ユーザ登録、ログイン認証などが使われる前にconfigure_permitted_parametersメソッドが実行される
  before_action :configure_permitted_parameters, if: :devise_controller?

  # sign_in後はユーザー詳細画面へ
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  # sign_out後はTop画面へ
  def after_sign_out_path_for(resource)
    root_path
  end


  protected

  # ユーザー登録（sign_up）の際に、ユーザー名（name）のデータ操作を
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
