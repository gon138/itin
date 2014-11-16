class ModifyPartnerTable < ActiveRecord::Migration
	def change
		create_table :partners do |t|
			t.string :name
			t.string :gender

			t.timestamps
		end
	end
end