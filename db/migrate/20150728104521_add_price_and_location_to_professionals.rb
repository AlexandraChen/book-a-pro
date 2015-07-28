class AddPriceAndLocationToProfessionals < ActiveRecord::Migration
  def change
  	add_column :professionals, :price_hr, :float
  	add_column :professionals, :location, :string
  end
end
