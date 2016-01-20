class CreateSubgroups < ActiveRecord::Migration
  def change
    create_table :subgroups do |t|
    	t.string  "ime_podgrupa"
    	t.integer "group_id"
    end
  end
end
