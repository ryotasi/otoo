class AddCategoryToAsas < ActiveRecord::Migration[6.1]
  def change
    add_column :asas, :category, :string
  end
end
