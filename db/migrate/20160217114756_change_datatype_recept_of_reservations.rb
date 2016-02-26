class ChangeDatatypeReceptOfReservations < ActiveRecord::Migration

    def up
      change_column :reservations, :recept, :string
    end
  
    def down
      change_column :reservations, :recept, :time
    end

end
