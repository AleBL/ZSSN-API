class ApplicationController < ActionController::API
  include ActionView::Helpers::TranslationHelper
  before_action :set_locale

  def set_locale
    if params[:locale].present? && I18n.available_locales.include?(params[:locale].to_sym)
      session[:locale] =
        params[:locale]
    end
    I18n.locale = session[:locale] || I18n.default_locale
  end

  def render_success(message, data = nil)
    response_data = { status: t('status.success'), message: message }
    response_data[:data] = data if data.present?
    render json: response_data, status: :ok
  end

  def render_not_found_error(class_name, id)
    render json: {
      status: t('status.error'),
      message: t('messages.not_found', class: class_name, id: id)
    }, status: :not_found
  end

  def render_unprocessable_entity_error(message, errors = nil)
    response_data = { status: t('status.error'), message: message }
    response_data[:data] = errors if errors.present?
    render json: response_data, status: :unprocessable_entity
  end
end
