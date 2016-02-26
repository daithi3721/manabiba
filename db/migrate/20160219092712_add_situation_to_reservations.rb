class AddSituationToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :situation, :string
  end
end
