class CreateAsas < ActiveRecord::Migration[6.1]
  def change
    create_table :asas do |t|
      t.string :image
      t.string :odai

      t.timestamps
    end
  end
end
