class AddYoutubeidToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :youtubeId, :string
  end
end
