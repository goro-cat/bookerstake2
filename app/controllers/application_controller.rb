class ApplicationController < ActionController::Base
  #deviseのコントローラに修正が必要な場合は、controllersのapplicationに記載(Userモデルに対して)
  
  before_action :configure_permitted_paramters, if: :devise_controller?
  ##if~デバイスコントローラが使用される前にconfigure~が実行される。
  
  def configure_permitted_paramters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:login, keys: [:name])
    ##devise_parameter_sanitizer.permitでデータ操作を許可するアクションメゾッドが指定。strong paramstersと同様の機能
  end
end
