class AddReportsToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :question_staff, :string
    add_column :reservations, :question_report, :string
  end
end
