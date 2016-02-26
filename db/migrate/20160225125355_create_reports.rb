class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :state
      t.date :date
      t.string :situation
      t.string :teacher
      t.string :subject
      t.integer :user_id
      t.text :reeport
      t.text :answer_report

      t.timestamps null: false
    end
  end
end
