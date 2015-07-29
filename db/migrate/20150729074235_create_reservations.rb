class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :date
      t.string   :user_id
      t.string   :professional_id
      t.timestamps null: false
    end
  end
end
