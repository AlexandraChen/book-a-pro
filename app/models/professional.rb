class Professional < ActiveRecord::Base
	belongs_to :user
	has_many :reservations, dependent: :destroy
	has_many :reviews, dependent: :destroy
	validates :title, presence: true, length: {maximum: 40}
	validates :description, presence: true
	validates :user, presence: true
	validates :location, presence: true
	validates :price_hr, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ } , numericality: {:greater_than => 0} 

	has_attached_file :prof_pic,
  		:styles => { 
		  	:medium => "336x336>",
		  	:thumb => "100x100>", 
		  	:small => "200x200#"  
  		}
 	validates_attachment_content_type :prof_pic, :content_type => /\Aimage\/.*\Z/

 	def self.search(query)
 		joins(:user).where("lower(name) LIKE ? OR lower(title) LIKE ? OR lower(location) like ?", 
 			"%#{query}%".downcase, "%#{query}%".downcase, "%#{query}%".downcase)
 	end
end
