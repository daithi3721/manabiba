class RemoveReleaseDayToLesson < ActiveRecord::Migration
  def change
    remove_column :lessons, :release_day, :datetime
  end
end
