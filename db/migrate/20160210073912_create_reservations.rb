class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user, index: true, foreign_key: true
      t.date :reception_date, null: false
      t.time :reception_time, null: false
      t.string :question_type, null: false
      t.string :question_image
      t.text :content, null: false

      t.timestamps null: false
    end
  end
end
