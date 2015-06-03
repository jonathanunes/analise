class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :nome
      t.string :twitter

      t.timestamps null: false
    end
  end
end
