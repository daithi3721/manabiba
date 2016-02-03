class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :school
      t.string :classroom
      t.string :consultant
      t.string :consulting_day
      t.string :appear_in
      t.string :password_digest

      t.timestamps null: false
      
      t.index :email, unique: true
    end
  end
end
