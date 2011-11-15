class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :retro_id
      t.string :note_type
      t.text :description
      t.string :responsible
      t.string :escalation
      t.timestamps
    end
  end
end
