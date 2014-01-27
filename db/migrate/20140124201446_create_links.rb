class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :link
      t.string :random_string
      t.string :visits

      t.timestamps
    end
  end
end
