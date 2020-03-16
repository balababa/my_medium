class Api::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :check_login

  private
  def check_login
    render json: { status: "sign_in_first"} unless user_signed_in?
    return
  end
end