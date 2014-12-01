class AddStateSchoolToUser < ActiveRecord::Migration
  def change
    add_column :users, :state, :string
    add_column :users, :school,  :string
  end
end
