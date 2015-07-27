class Professional < User
	validates :title, presence: true
	validates :description, presence: true
end
