class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :timeoutable, :omniauthable, :omniauth_providers => [:facebook]

  has_one :professional, dependent: :destroy
  accepts_nested_attributes_for :professional
  has_many :reservations, dependent: :destroy
  has_many :reviews
  validates :email, presence: true, length: {maximum: 250}
  validates :name, presence: true #space validation
  # validates :last_name, presence: true, length: {maximum: 30}
  has_attached_file :prof_pic,
  	:styles => { 
	  	:medium => "300x300>",
	  	:thumb => "100x100>", 
	  	:small => "200x200#"  
  	},
    :default_url => "no_pic.png"

 	validates_attachment_content_type :prof_pic, :content_type => /\Aimage\/.*\Z/

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name 
      # user.image = auth.info.image  // How to pic the url of profile pic?
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
