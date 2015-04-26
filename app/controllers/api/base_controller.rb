class Api::BaseController < ApplicationController
  protect_from_forgery_with: :null_session
  before_action :destroy_session

  def destroy_session
    request.session_options[:skip] = true
  end

  config.middleware.insert_before 0, "Rack::Cors" do
    allow do
      origins '*'
      resource '*', :headers => :any, :methods => [:get, :post, :put, :patch, :delete, :options, :head]
    end
  end

end
