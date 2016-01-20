class CreateProducers < ActiveRecord::Migration
  def change
    create_table :producers do |t|
    	t.string "ime_proizvoditel"
	    t.string "poteklo"
	    t.string "picture"
	    t.string "website"
    end
  end
end
