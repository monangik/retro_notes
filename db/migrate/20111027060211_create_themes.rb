class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
    	t.string :name
    end
  end
end
