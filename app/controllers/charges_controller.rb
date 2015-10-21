class ChargesController < ApplicationController

	def create
		customer = Stripe::Customer.create(
			email: current_user.email,
			card: params[:stripeToken]
		)

		charge = Stripe::Charge.create(
			customer: customer.id,
			amount: Amount.default,
			description: "Premium Membership - #{current_user.email}",
			currency: 'usd'
		)

		current_user.premium!
		flash[:notice] = "Thanks for your support, #{current_user.email}"
		redirect_to wikis_path

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_charge_path
	end

	def new
		@stripe_btn_data = {
			key: "#{Rails.configuration.stripe[:publishable_key]}",
			description: "Premium Membership - #{current_user.email}",
			amount: Amount.default
		}
	end

	def destroy
		current_user.member!
		!current_user.wikis.is_private!
	end

end
