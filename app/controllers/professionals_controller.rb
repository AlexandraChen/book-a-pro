class ProfessionalsController < ApplicationController
	before_action :authenticate_user!
	
	def show
		@pro_user = current_user.professional	
	end

	def new
		@pro_user = Professional.new
	end

	def create
		@pro_user = current_user.build_professional(pro_params)

		if @pro_user.valid?
			@pro_user.save
			redirect_to user_professional_path(current_user.id, @pro_user.id),
					notice: 'Professional profile succesfully created!'
		else
			render :new, notice: 'Something went wrong :( Please try again'
		end
	end

	def edit
		@pro_user = current_user.professional
	end

	def update
  	@pro_user = current_user.professional
    @pro_user.update_attributes(pro_params)
    if @pro_user.valid?
      @pro_user.save
      redirect_to user_professional_path(current_user.id, @pro_user.id), notice: "Profile succesfully updated"
      return
    end
    render :edit
  end

	def destroy
		@pro_user = current_user.professional	
		@pro_user.destroy
		redirect_to user_path(current_user.id),
				notice: "Professional profile successfuly deleted"
	end




	private
	def pro_params
		params.require(:professional).permit(:title, :description, :prof_pic, :price_hr, :location)
	end
end
