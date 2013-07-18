class CreatePermissionTypes < ActiveRecord::Migration
  def change
    create_table :permission_types do |t|
      t.string :name
    end
  end
end
