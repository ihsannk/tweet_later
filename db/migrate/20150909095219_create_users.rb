class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :twitter_handle
  		t.string :access_token, index: true
  		t.string :access_token_secret, index: true
  		t.timestamps null: false
  	end
  end
end
