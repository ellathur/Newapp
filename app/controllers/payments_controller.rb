class PaymentsController < ApplicationController

  def create
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @user = current_user

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: (@product.price*100 ), # amount in cents, again
        currency: "gbp",
        source: token,
        description: params[:stripeEmail],
        receipt_email: @user.email,
      )

    if charge.paid
      Order.create(product_id: @product.id, user_id: @user.id, total: @product.price, created_at: Time.now)
      UserMailer.payment_confirmation(@user, @product).deliver_now
      redirect_to product_path(@product), notice: 'Purchase Successful. Thank You!'
    end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end


  end
end
