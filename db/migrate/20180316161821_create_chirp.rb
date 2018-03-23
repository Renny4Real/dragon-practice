class CreateChirp < ActiveRecord::Migration[5.1]
  def change
    create_table :chirps do |t|
      t.integer :uid, limit: 8
      t.text :text, default: ""
      t.timestamps
    end
  end
end
