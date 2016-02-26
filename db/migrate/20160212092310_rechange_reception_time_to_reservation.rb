class RechangeReceptionTimeToReservation < ActiveRecord::Migration
  def up
    change_column :reservations, :reception_time, :time
  end

  def down
    change_column :reservations, :reception_time, :string, null: false
  end
end
