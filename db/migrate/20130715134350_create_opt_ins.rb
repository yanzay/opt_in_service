class CreateOptIns < ActiveRecord::Migration
  def change
    create_table :opt_ins do |t|
      t.string :email, :mobile, :first_name, :last_name
      t.integer :permission_type_id
      t.integer :channel_id
      t.integer :company_id
      t.boolean :active
      t.timestamps
    end

    add_index :opt_ins, [:company_id, :channel_id], unique: true
  end
end
