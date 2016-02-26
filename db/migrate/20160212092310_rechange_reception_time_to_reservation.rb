class RechangeReceptionTimeToReservation < ActiveRecord::Migration
  def up
    change_column :Reservations, :reception_time, :time
  end

  def down
    change_column :Reservations, :reception_time, :string, null: false
  end
end
