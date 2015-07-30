class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :professional
	validates :user, presence: true
	validates :professional, presence: true
	validates :title, presence: true
	validates :description, presence: true
	validates :rating, presence: true

	def self.has_worked_with?(pro,user)
		@user = user
		@pro_user = pro
		reservations = Reservation.where(professional: @pro_user, user: @user).all
		reservations.where("date <= ?", DateTime.now)
		if reservations.empty?
			false
		else
			true
		end
	end

end
