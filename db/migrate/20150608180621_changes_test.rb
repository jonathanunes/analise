class ChangesTest < ActiveRecord::Migration
  def change
  	change_column :medidas, :twitter, :float
  end
end
