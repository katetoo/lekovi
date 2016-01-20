class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string  "ime_korisnik"
	    t.string  "prezime_korisnik"
	    t.string  "email_korisnik"
	    t.string  "profesija_korisnik"
	    t.boolean "admin",              default: false
	    t.string  "password_digest"
    end
  end
end
