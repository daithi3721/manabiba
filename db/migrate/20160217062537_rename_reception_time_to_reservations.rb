class RenameReceptionTimeToReservations < ActiveRecord::Migration
  def change
    rename_column :reservations, :reception_time, :recept
  end
end
