class AddInstagramToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :instagram, :string
  end
end
