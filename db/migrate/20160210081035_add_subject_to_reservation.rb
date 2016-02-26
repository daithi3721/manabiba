class AddSubjectToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :subject, :string
  end
end
