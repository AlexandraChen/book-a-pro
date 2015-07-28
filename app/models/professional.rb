class Professional < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true
	validates :description, presence: true
	validates :user, presence: true

	has_attached_file :prof_pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }
 	validates_attachment_content_type :prof_pic, :content_type => /\Aimage\/.*\Z/


end
