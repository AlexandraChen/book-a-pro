class Api::ProfessionalsController < ApplicationController
	respond_to :json

	def index
		if params[:search]
      @pro_users = Professional.search(params[:search]).order("created_at DESC")
    else
      @pro_users = Professional.order("created_at DESC") #this is not working
    end

		render :index
	end

end
