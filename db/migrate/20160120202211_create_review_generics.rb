class CreateReviewGenerics < ActiveRecord::Migration
  def change
    create_table :review_generics do |t|
    	t.string   "komentar_na_generika"
	    t.integer  "user_id"
	    t.integer  "generic_name_id"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.boolean  "approve",              default: false
    end
  end
end
