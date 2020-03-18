class UsersController < ApplicationController

  def pricing
  end

  def payment
    @fee = ENV["price_#{params[:type]}"]
    @payment_type = (params[:type] == 'vip') ? 'VIP 會員' : '白金會員'

    @token = gateway.client_token.generate()
  end
  private
  def gateway
    Braintree::Gateway.new(
      environment:  :sandbox,
      merchant_id:  ENV['merchant_id'],
      public_key:  ENV['public_key'],
      private_key:  ENV["private_key"],
    )
  end
end
