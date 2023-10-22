class AddUserIdToAsas < ActiveRecord::Migration[6.1]
  def change
    add_column :asas, :user_id, :integer
  end
end
