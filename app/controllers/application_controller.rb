class ApplicationController < ActionController::API 
  include ActionView::Helpers::TranslationHelper
  before_action :set_locale

  def set_locale
    session[:locale] = params[:locale] if params[:locale].present? && I18n.available_locales.include?(params[:locale].to_sym)
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
