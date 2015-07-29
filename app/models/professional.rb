class Professional < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	validates :title, presence: true
	validates :description, presence: true
	validates :user, presence: true
	validates :location, presence: true
	validates :price_hr, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ } , numericality: {:greater_than => 0} 

	  has_attached_file :prof_pic,
  	:styles => { 
	  	:medium => "300x300>",
	  	:thumb => "100x100>", 
	  	:small => "200x200#"  
  	}
 	validates_attachment_content_type :prof_pic, :content_type => /\Aimage\/.*\Z/

 	def self.search(query)
    	where("title like ?", "%#{query}%")
    	where("location like ?", "%#{query}%")

    	#how to query by professional.user.name??
 	end
end
