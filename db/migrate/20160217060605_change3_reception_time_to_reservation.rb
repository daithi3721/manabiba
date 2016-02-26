class Change3ReceptionTimeToReservation < ActiveRecord::Migration
  def change
    def up
      change_column :Reservations, :reception_time, :string
    end
  
    def down
      change_column :Reservations, :reception_time, :time
    end
  end
end
