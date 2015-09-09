class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :twitter_handle
  		t.string :password
  		t.timestamps null: false
  	end
  end
end
