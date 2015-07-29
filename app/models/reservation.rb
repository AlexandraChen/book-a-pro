class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :professional
	validates :date, presence: true
	validates :user, presence: true
	validates :professional, presence: true
end
