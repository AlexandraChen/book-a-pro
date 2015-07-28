class SitesController < ApplicationController
	def index
    if params[:search]
      @pro_users = Professional.search(params[:search]).order("created_at DESC")
    else
      @pro_users = Professional.order("created_at DESC")
    end
  end
end
