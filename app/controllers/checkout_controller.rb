class CheckoutController < ApplicationController

  def create
    listing = Listing.find(params[:id])
    @session = Stripe::Checkout::Session.create({
        customer: current_user.stripe_customer_id,
        payment_method_types: ['card'],
        line_items: [{
            name: listing.name,
            amount: listing.retail_price,
            currency: "aud",
            quantity: 1
        }],
        mode: 'payment',
        success_url: root_url,
        cancel_url: root_url,
    });
    respond_to do |format|
        format.js
    end
  end

end 