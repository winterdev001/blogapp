class AddAdminToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_reference :blogs, :admin, null: false, foreign_key: true
  end
end
