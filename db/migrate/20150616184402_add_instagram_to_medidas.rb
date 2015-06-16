class AddInstagramToMedidas < ActiveRecord::Migration
  def change
    add_column :medidas, :instagram, :integer
  end
end
