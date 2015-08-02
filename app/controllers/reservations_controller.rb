class ReservationsController < ApplicationController	
	before_action :authenticate_user!, only: [:create, :reservations]

	def create
		@reservation = current_user.reservations.new(reservation_params)
		if @reservation.save
			ReservationMailer.user_reservation_email(@reservation).deliver_now
			ReservationMailer.pro_reservation_email(@reservation).deliver_now
			redirect_to root_path, notice: t(:reservation_success)
		else
			redirect_to professional_path(@reservation.professional_id), notice: @reservation.errors.full_messages.first
		end
	end
	
	def reservations
  end

	private
	def reservation_params
		params.require(:reservation).permit(:date, :professional_id)
	end
end
