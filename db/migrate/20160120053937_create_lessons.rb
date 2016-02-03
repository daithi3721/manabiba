class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :teacher, null: false
      t.string :movie_url, null: false
      t.datetime :release_day, null: false
    
      t.timestamps null: false
    end
  end
end
