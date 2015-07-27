class CreateProfessionals < ActiveRecord::Migration
  def change
    create_table :professionals do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
