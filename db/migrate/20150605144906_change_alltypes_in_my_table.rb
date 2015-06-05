class ChangeAlltypesInMyTable < ActiveRecord::Migration
  def change
    change_column :medidas, :ftalk, :float
    change_column :medidas, :flikes, :float
  end
end
