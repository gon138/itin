class ModifyPartnerTable < ActiveRecord::Migration
  def change
  	add_column :partners, :name, :string
  	add_column :partners, :gender, :string
  end
end
