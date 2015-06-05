class RemoveFtalkFromEventos < ActiveRecord::Migration
  def change
    remove_column :eventos, :ftalk, :integer
  end
end
