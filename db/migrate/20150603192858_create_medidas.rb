class CreateMedidas < ActiveRecord::Migration
  def change
    create_table :medidas do |t|
      t.references :evento, index: true, foreign_key: true
      t.integer :twitter

      t.timestamps null: false
    end
  end
end
