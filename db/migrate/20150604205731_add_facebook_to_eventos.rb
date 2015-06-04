class AddFacebookToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :flikes, :integer
    add_column :eventos, :ftalk, :integer
  end
end
