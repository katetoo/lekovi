class CreateMedicaments < ActiveRecord::Migration
  def change
    create_table :medicaments do |t|
    	t.string  "ime_lek"
	    t.string  "komentar"
	    t.integer "generic_name_id"
	    t.integer "producer_id"
    end
  end
end
