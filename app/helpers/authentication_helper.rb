# frozen_string_literal: true

module AuthenticationHelper
  TOKEN_PARAM_NAME = :token

  def token_value_from_request(token_param = TOKEN_PARAM_NAME)
    params[token_param]
  end

  def current_user
    token = AuthenticationToken.find_by(token: token_value_from_request)
    return nil unless token.present?

    @current_user ||= token.user
  end

  def signed_in?
    !!current_user
  end

  def authenticate!
    error!({ error_msg: 'authentication_error' }, 401) unless signed_in?
  end

  def admin_check
    error!({ 'error_msg' => 'Bad request' }, 401) unless current_user.present? && current_user.admin
  end
end
