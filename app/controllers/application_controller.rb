class ApplicationController < ActionController::Base
  
  before_action :set_locale
  before_action :authenticate_user!

  def default_url_options
    { locale: ((I18n.locale == I18n.default_locale) ? nil : I18n.locale) }
  end  

private

  def after_sign_in_path_for(resource)
    admin_tests_path if current_user.admin?
  end
  
  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end  
end