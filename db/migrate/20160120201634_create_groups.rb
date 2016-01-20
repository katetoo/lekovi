class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
    	t.string "ime_grupa"
    end
  end
end
