class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :allow_ajax_request_from_other_domains

  def allow_ajax_request_from_other_domains
    headers['Access-Control-Allow-Origin'] = '*'
    # headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Request-Methods'] = "POST, GET, PUT, DELETE, OPTIONS"
  end
end
