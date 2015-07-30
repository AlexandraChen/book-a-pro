class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :professional
	validates :date, presence: true
	validates :user, presence: true
	validates :professional, presence: true
	validate :future_date

	def future_date
		if date < DateTime.now
			errors.add(:date, "Must be a future date!")
		end
	end
end


