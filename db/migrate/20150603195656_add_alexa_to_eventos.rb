class AddAlexaToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :alexa, :string
  end
end
