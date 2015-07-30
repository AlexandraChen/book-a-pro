class ReviewsController < ApplicationController
	def create
		@review = current_user.reviews.new(review_params)

		if @review.save
			redirect_to professional_path(@review.professional_id), 
				notice: t(:review_success)
		else
			redirect_to professional_path(@review.professional_id),
				notice: @review.errors.full_messages.first
		end
	end

	private
	def review_params
		params.require(:review).permit(:rating, :professional_id, :title, :description)
	end
end
