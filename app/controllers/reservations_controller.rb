class ReservationsController < ApplicationController	
	before_action :authenticate_user!, only: [:create]

	def create
		@reservation = current_user.reservations.new(reservation_params)
		if @reservation.valid?
			@reservation.save
			ReservationMailer.user_reservation_email(@reservation).deliver_now
			ReservationMailer.pro_reservation_email(@reservation).deliver_now
			redirect_to root_path, notice: 'Reservation succesfully posted!'
		else
			redirect_to professional_path(@reservation.professional_id), notice: 'Something went wrong :( Please try again'
		end
	end

	# def edit
 #    @reservation = reservation.find(params[:id]) ||
 #    render_404(params)
 #    @product = Product.find(@reservation.product_id)
 #  end

	# def update
	# 	@reservation = reservation.find(params[:id])
	# 	@product = Product.find(@reservation.product_id)
	# 	if @reservation.update_attributes(reservation_params)
	# 		redirect_to product_path(@reservation.product_id), notice: "reservation succesfully updated"
	# 	else
	# 		render :edit
	# 	end
	# end

	private
	def reservation_params
		params.require(:reservation).permit(:date, :professional_id)
	end
end
