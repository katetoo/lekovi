class CreateReviewMeds < ActiveRecord::Migration
  def change
    create_table :review_meds do |t|
    	t.string   "komentar_na_lek"
	    t.integer  "user_id"
	    t.integer  "medicament_id"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.boolean  "approve",         default: false
    end
  end
end
