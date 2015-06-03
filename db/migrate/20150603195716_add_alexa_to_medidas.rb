class AddAlexaToMedidas < ActiveRecord::Migration
  def change
    add_column :medidas, :alexa, :string
  end
end
