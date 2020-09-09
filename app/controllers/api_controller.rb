class ApiController < ActionController::API
  acts_as_token_authentication_handler_for User, unless: :no_authentication_required

  def no_authentication_required
    self._process_action_callbacks.map {|c| c.filter }.compact.include? :no_authentication_required
  end


end