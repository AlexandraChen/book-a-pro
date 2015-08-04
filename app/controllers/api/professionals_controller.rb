class Api::ProfessionalsController < ApplicationController
	respond_to :json

	def index
		if params[:search]
      @pro_users = Professional.search(params[:search]).order("created_at DESC")
    end

		render :index
	end

end
