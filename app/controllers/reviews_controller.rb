class ReviewsController < ApplicationController
	def create
		@review = current_user.reviews.new(review_params)

		if Review.has_worked_with?(@review.professional, current_user)
			if @review.valid? 
				@review.save
				redirect_to professional_path(@review.professional_id), 
					notice: "Review successfully posted"
			else
				redirect_to professional_path(@review.professional_id),
					notice: "Please fill in all the fields"
			end
		else
			redirect_to professional_path(@review.professional_id),
				notice: "You haven't worked with this pro"
		end
	end

	private
	def review_params
		params.require(:review).permit(:rating, :professional_id, :title, :description)
	end
end
