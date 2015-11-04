class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :professional
	validates :date, presence: true
	validates :user, presence: true
	validates :professional, presence: true
	validate :validate_future_date

	def validate_future_date
		if date === nil
			errors.add(:date, "Please select a date")
		elsif date < DateTime.now
			errors.add(:date, I18n.t(:reservation_fail))
		end
	end

	scope :past, -> { where("date < ?", DateTime.now).order("date ASC") }

	scope :future, -> { where("date > ?", DateTime.now).order("date ASC") }
end


