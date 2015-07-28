class ProfessionalsController < ApplicationController
	before_action :authenticate_user!
	
	def new
		@pro_user = Professional.new
	end

	def create
		@pro_user = current_user.professional
		@pro_user = Professional.new(pro_params)

		if @pro_user.valid?
			@pro_user.save
			redirect_to "/", notice: 'Professional profile succesfully create!'
		else
			redirect_to "/", notice: 'Something went wrong :( Please try again'
		end
	end

	def update
	end

	def destroy
	end




	private
	def pro_params
		params.require(:professional).permit(:title, :description, :prof_pic)
	end
end
