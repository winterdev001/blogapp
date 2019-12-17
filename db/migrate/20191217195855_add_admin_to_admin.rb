class AddAdminToAdmin < ActiveRecord::Migration[6.0]
  def change
    change_table :admins do |t|
      t.column :admin, :boolean, default: false
    end
  end
end
