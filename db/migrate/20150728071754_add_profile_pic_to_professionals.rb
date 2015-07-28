class AddProfilePicToProfessionals < ActiveRecord::Migration
  def up
  	add_attachment :professionals, :prof_pic
  end

  def down 
  	remove_attachment :professionas, :prof_pic
  end
end
