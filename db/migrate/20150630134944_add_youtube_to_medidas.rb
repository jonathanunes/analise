class AddYoutubeToMedidas < ActiveRecord::Migration
  def change
    add_column :medidas, :youtubeSubscribers, :integer
    add_column :medidas, :youtubeViews, :integer
  end
end
