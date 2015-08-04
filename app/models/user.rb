class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :timeoutable, :confirmable

  has_one :professional, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :reviews
  validates :email, presence: true, length: {maximum: 250}
  validates :name, presence: true, length: {maximum: 30}
  validates :last_name, presence: true, length: {maximum: 30}
  has_attached_file :prof_pic,
  	:styles => { 
	  	:medium => "300x300>",
	  	:thumb => "100x100>", 
	  	:small => "200x200#"  
  	},
    :default_url => "/images/:style/no_pic.png"

 	validates_attachment_content_type :prof_pic, :content_type => /\Aimage\/.*\Z/

end
