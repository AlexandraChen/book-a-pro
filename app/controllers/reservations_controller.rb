class ReservationsController < ApplicationController	
	before_action :authenticate_user!, only: [:create, :edit, :destroy]

	def create
		@reservation = Reservation.new(reservation_params)
		pro = params[:professional_id]
		@reservation.user_id = current_user.id
		pro = @reservation.professional_id
		if @reservation.valid?
			@reservation.save
			redirect_to root_path, notice: 'Reservation succesfully posted!'
		else
			redirect_to professional_path(pro), notice: 'Something went wrong :( Please try again'
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
