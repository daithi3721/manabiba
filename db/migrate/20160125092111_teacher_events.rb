class TeacherEvents < ActiveRecord::Migration
  def change
    add_column :events, :teacher, :string
  end
end
