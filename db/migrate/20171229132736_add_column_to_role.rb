class AddColumnToRole < ActiveRecord::Migration[5.1]
  def change
   add_column :roles,:name,:string
  end
end
