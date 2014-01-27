class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :links, :link, :full_link
  end
end
