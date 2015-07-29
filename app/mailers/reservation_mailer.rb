class ReservationMailer < ApplicationMailer
	default from: "alexfinalproject@gmail.com"

	def user_reservation_email(reservation)
		@reservation = reservation
		mail(to: @reservation.user.email, subject: "#{@reservation.user.name}, here is your new reservation", template_name: "user_reservation")
	end

	def pro_reservation_email(reservation)
		@reservation = reservation
		mail(to: @reservation.professional.user.email, subject: "#{@reservation.professional.user.name}, here is your new reservation", template_name: "pro_reservation")
	end
end
