class CreateGenericNames < ActiveRecord::Migration
  def change
    create_table :generic_names do |t|
    	t.string "genericko_ime"
	    t.string "detalna_podelba"
	    t.text   "sostav",                 limit: 255
	    t.text   "indikacii",              limit: 255
	    t.text   "interakcii",             limit: 255
	    t.text   "dejstvo",                limit: 255
	    t.text   "merki_na_pretpazlivost", limit: 255
	    t.text   "doziranje",              limit: 255
	    t.text   "nesakani_dejstva",       limit: 255
	    t.text   "kontraindikacii",        limit: 255
	    t.string "substitution_id"
    end
  end
end
