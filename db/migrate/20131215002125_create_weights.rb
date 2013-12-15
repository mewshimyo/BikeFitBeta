class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.integer :user_id
      t.float :weight
      t.date :date

      t.timestamps
    end
  end
end
