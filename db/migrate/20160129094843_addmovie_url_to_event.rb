class AddmovieUrlToEvent < ActiveRecord::Migration
  def change
    add_column :events, :movie_url, :string
  end
end
