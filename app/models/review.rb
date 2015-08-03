class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :professional
	validates :user, presence: true
	validates :professional, presence: true
	validates :title, presence: true
	validates :description, presence: true
	validates :rating, presence: true

	validate :has_worked_with

	def has_worked_with
		reservations = Reservation.where(professional: professional, user: user).where("date <= ?", DateTime.now)
		if reservations.empty?
			errors.add(:base, I18n.t(:review_error) )
		end
	end

end
