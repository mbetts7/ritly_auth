class FixVisitsDataType < ActiveRecord::Migration
  def up
    change_table :links do |t|
      t.change :visits, :integer
    end
  end
 
  def down
    change_table :links do |t|
      t.change :visits, :string
    end
  end
end
