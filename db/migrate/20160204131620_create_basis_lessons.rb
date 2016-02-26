class CreateBasisLessons < ActiveRecord::Migration
  def change
    create_table :basis_lessons do |t|
      t.string :subject
      t.integer :number
      t.string :name
      t.string :teacher
      t.string :thumbnail
      t.string :movie_url
      t.string :school

      t.timestamps null: false
      
      t.index :movie_url, unique: true
    end
  end
end
