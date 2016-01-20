class CreateSubstitutions < ActiveRecord::Migration
  def change
    create_table :substitutions do |t|
    	t.string  "ime_podelba"
    	t.integer "subgroup_id"
    end
  end
end
