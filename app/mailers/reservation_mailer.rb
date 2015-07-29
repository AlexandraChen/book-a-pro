class ReservationMailer < ApplicationMailer
	default from: "alexfinalproject@gmail.com"

	def user_reservation_email(user)
		@user = user
		mail(to: @user.email, subject: "#{@user.name}, here is your new reservation", template_name: "user_reservation")
	end

	def pro_reservation_email(pro)
		@pro = pro
		mail(to: @pro.email, subject: "#{@pro.name}, here is your new reservation", template_name: "pro_reservation")
	end
end
