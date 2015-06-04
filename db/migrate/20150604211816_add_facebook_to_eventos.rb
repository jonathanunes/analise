class AddFacebookToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :facebook, :string
  end
end
