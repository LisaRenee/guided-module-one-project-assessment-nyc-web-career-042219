class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.integer :stylist_id
      t.integer :client_id
    end
  end 
end
