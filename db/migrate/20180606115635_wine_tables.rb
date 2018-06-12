class WineTables < ActiveRecord::Migration[5.1]
  def change
    create_table :wines do |t|
      t.text "image"
      t.text "content"
      t.string "name"
      t.string "color"
      t.string "area"
      t.integer "user_id"
      t.timestamps
    end
  end
end
