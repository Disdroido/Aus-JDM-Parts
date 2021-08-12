class CheckoutController < ApplicationController

  def create
    @session = Stripe::Checkout::Session.create({
        customer: current_user.stripe_customer_id,
        payment_method_types: ['card'],
        line_items: @cart.collect { |item| item.to_builder.attributes! },
        mode: 'payment',
        success_url: "https://ausjdmparts.herokuapp.com/success",
        cancel_url: "https://ausjdmparts.herokuapp.com/cabcek"
    });
    respond_to do |format|
        format.js
    end
  end

end 