class AddFacebookToMedidas < ActiveRecord::Migration
  def change
    add_column :medidas, :flikes, :integer
    add_column :medidas, :ftalk, :integer
  end
end
