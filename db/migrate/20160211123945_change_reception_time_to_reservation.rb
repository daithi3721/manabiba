class ChangeReceptionTimeToReservation < ActiveRecord::Migration
  def change
    def up
      change_column :Reservations, :reception_time, :string, null: false
    end

    def down
      change_column :Reservations, :reception_time, :time, null: false
    end
  end
end
