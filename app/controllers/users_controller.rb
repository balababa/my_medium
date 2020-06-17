class UsersController < ApplicationController

  def pricing
  end

  def bookmarks
    @stories = Story.find(current_user.bookmarks.map {|bookmark| bookmark[:story_id]})
  end

  def followings
    @users = User.find(current_user.follows.map {|following| following[:following_id]})
  end

  def payment
    @fee = ENV["price_#{params[:type]}"]
    @payment_type = (params[:type] == 'vip') ? 'VIP 會員' : '白金會員'

    @token = gateway.client_token.generate()
  end

  def pay
    fee = ENV["price_#{params[:type]}"]

    result = gateway.transaction.sale(
      amount: fee,
      payment_method_nonce:  params[:payment_nonce],
      options:  {
        submit_for_settlement:  true
      }
    )
    if result.success?
      current_user.instance_eval("#{params[:type]}_user!")
      redirect_to root_path, notice: "付費成功"
    else
      result.errors.each do |error|
        puts error.attribute
        puts error.code
        puts error.message
      end
      redirect_to root_path, notice: "付費失敗"
    end
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
