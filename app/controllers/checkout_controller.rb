class CheckoutController < ApplicationController

  def create
    listing = Listing.find(params[:id])
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        name: listing.name,
        amount: listing.retail_price,
        currency: "usd",
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