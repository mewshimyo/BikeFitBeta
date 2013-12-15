class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.integer :user_id
      t.date :date
      t.float :distance
      t.integer :time
      t.integer :elevation
      t.string :strava_link
      t.boolean :type

      t.timestamps
    end
  end
end
