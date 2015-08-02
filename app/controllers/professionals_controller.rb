class ProfessionalsController < ApplicationController
	
	def show
		@pro_user = Professional.find(params[:id])
		@reservation = @pro_user.reservations.new	
		@review = Review.new
		@rating = 0
		unless @pro_user.reviews.empty?
			@pro_user.reviews.each do |review|
				@rating+=review.rating
			end
			@rating = @rating. / @pro_user.reviews.count
		end
	end

	def new
		@pro_user = Professional.new
	end

	def create
		@pro_user = current_user.build_professional(pro_params)
		if @pro_user.save
			redirect_to professional_path(@pro_user.id), notice: t(:pro_new_success)
		else
			flash[:notice] = t(:pro_new_fail)
			render :new
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
      redirect_to professional_path(@pro_user.id), notice: t(:pro_update_success)
      return
    end
    flash[:notice] = t(:pro_new_fail)
    render :edit
  end

	def destroy
		@pro_user = current_user.professional	
		@pro_user.destroy
		redirect_to user_path,
			notice: t(:pro_delete)
	end

	def edit_profpic
		@pro_user = current_user.professional
	end

	def update_profpic
		@pro_user = current_user.professional
    @pro_user.update_attributes(pro_params)
    if @pro_user.save
      redirect_to professional_path(@pro_user.id), notice: t(:pic_update_success)
      return
    end
    flash[:notice] = t(:pic_update_fail)
    render :edit_profpic
	end

	private
	def pro_params
		params.require(:professional).permit(:title, :description, :prof_pic, :price_hr, :location)
	end
end
