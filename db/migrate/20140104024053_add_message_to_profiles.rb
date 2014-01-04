class AddMessageToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :profile, :string
  end
end
